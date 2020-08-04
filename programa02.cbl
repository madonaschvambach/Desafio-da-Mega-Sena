      $set sourceformat"free"

      *>--- divisão de identificação do programa
       identification division.
      *>--- nome do programa
       program-id. "programa02".

      *>--- nome do autor
       author. "Madona Schvambach".
       installation. "PC".

      *>--- data que o programa foi escrito
       date-written. 22/07/2020.
       date-compiled. 04/08/2020.

      *>--- divisao para configuração do programa
       environment division .
       configuration section.

      *>--- declarado que será utilizado vírgulo ao invés de ponto
           special-names. decimal-point is comma.

      *>--- declaracao de recursos eternos
       input-output Section.
       file-control.
       i-o-control.


      *>--- declaracao de variaveis
       data division.

      *>--- variáveis de arquivos
       file section.


      *>--- variavéis de trabalho
       working-storage section.


       77  ws-quant-num-sorteados                  pic 9(01) value 6.

       01  ws-numeros-usuario    occurs 10.
           05  ws-numero                           pic 9(02).


       01  ws-numeros-sorteados    occurs 06.
           05  ws-num-sorteado                     pic 9(02).


       01  ws-entre-01-60                          pic x(01) value "v".
           88  ws-falso-01-60                      value "f".
           88  ws-verdadeiro-01-60                 value "v".


       01  ws-numeros-repetidos                    pic x(01) value "n".
           88  ws-rep-sim                          value "s".
           88  ws-rep-nao                          value "n".


       01  ws-mensagens.
           05  ws-mensagem1                        pic x(40) value space.
           05  ws-mensagem2                        pic x(40) value space.


       77  ws-igual-zero                           pic x(09) value "n".
           88  ws-sim-zero                         value "s".
           88  ws-nao-zero                         value "n".


       77  ws-conferir-num-sorteado                pic x(09) value "n".
           88  ws-num-igual                        value "s".
           88  ws-num-n-igual                      value "n".


       01  ws-sementes.
           05  ws-semente1                         pic 9(08).
           05  ws-semente                          pic 9(08).


       01  ws-inicio-temp-execucao.
           05  ws-ano                              pic 9(04).
           05  ws-mes                              pic 9(02).
           05  ws-dia                              pic 9(02).
           05  ws-hora                             pic 9(02).
           05  ws-minuto                           pic 9(02).
           05  ws-centesimo-segundo                pic 9(02).
           05  ws-diferenca-greenwich              pic x(05).


       01  ws-fim-temp-execucao.
           05  ws-fano                             pic 9(04).
           05  ws-fmes                             pic 9(02).
           05  ws-fdia                             pic 9(02).
           05  ws-fhora                            pic 9(02).
           05  ws-fminuto                          pic 9(02).
           05  ws-fcentesimo-segundo               pic 9(02).
           05  ws-fdiferenca-greenwich             pic x(05).


       01  ws-time.
           05  ws-time-hora                        pic 9(02).
           05  ws-time-minuto                      pic 9(02).
           05  ws-time-centesimo                   pic 9(02).

       77  ws-q-vezes-sorteio                      pic 9(15).
       77  ws-numeros-acertados                    pic 9(01) value 0.
       77  ws-aux-igual-zero                       pic 9(02) value 0.
       77  ws-aux-num-1-60                         pic 9(02).
       77  ws-i                                    pic 9(02).
       77  ws-s                                    pic 9(02).
       77  aux_erase                               pic 9(01) value 0.
       77  aux-num-tela                            pic 9(03).


      *>--- variaveis para comunicaçao entre programa
       linkage section.


       01  ls-tela-menu-principal.
           05  ls-quant-aposta                     pic 9(02).
           05  ls-mensagem                         pic x(40).
           05  ls-sair-programa                    pic x(01).
               88  ls-continuar                    value space.
               88  ls-sair                         value "x" "X".
           05  ls-voltar-menu                      pic x(01) value space.
               88  ls-voltar                       value "x" "X".
               88  ls-n-voltar                     value space.


      *>--- declaração de tela
       screen section.


       01  sc-tela-menu-aposta-06.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-         Sorteio Mega Sena - 06 numeros                --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Digite os 06 numeros da aposta:                       --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "- num1[  ] num2[  ] num3[  ] num4[  ] num5[  ] num6[  ] --".
           05  line 07 col 01 value "-                                                       --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "-                                                       --".
           05  line 11 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)   using ls-voltar-menu.
           05  sc-num-01       line 06 col 08 pic 9(02)   using ws-numero(01).
           05  sc-num-02       line 06 col 17 pic 9(02)   using ws-numero(02).
           05  sc-num-03       line 06 col 26 pic 9(02)   using ws-numero(03).
           05  sc-num-04       line 06 col 35 pic 9(02)   using ws-numero(04).
           05  sc-num-05       line 06 col 44 pic 9(02)   using ws-numero(05).
           05  sc-num-06       line 06 col 53 pic 9(02)   using ws-numero(06).
           05  sc-mensagem1    line 08 col 07 pic x(40)   from  ws-mensagem1 foreground-color 12.
           05  sc-mensagem2    line 09 col 07 pic x(40)   from  ws-mensagem2 foreground-color 12.

       01  sc-tela-fim-aposta06.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-                  Sorteio Mega Sena                    --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Numeros de entrada:                                   --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "-                                                       --".
           05  line 07 col 01 value "- Numeros Sorteados:                                    --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "- Tempo Sorteio:                                        --".
           05  line 11 col 01 value "-                                                       --".
           05  line 12 col 01 value "-                                                       --".
           05  line 13 col 01 value "- Quantidade de sorteios:                               --".
           05  line 14 col 01 value "-                                                       --".
           05  line 15 col 01 value "-                                                       --".
           05  line 16 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)      using ls-voltar-menu.
           05  sc-num-01       line 05 col 03 pic 9(02)      from  ws-numero(01).
           05  sc-num-02       line 05 col 06 pic 9(02)      from  ws-numero(02).
           05  sc-num-03       line 05 col 09 pic 9(02)      from  ws-numero(03).
           05  sc-num-04       line 05 col 12 pic 9(02)      from  ws-numero(04).
           05  sc-num-05       line 05 col 15 pic 9(02)      from  ws-numero(05).
           05  sc-num-06       line 05 col 18 pic 9(02)      from  ws-numero(06).
           05  sc-num-sort     line 08 col 03 pic 9(02)      from  ws-num-sorteado(01).
           05  sc-num-sort     line 08 col 06 pic 9(02)      from  ws-num-sorteado(02).
           05  sc-num-sort     line 08 col 09 pic 9(02)      from  ws-num-sorteado(03).
           05  sc-num-sort     line 08 col 12 pic 9(02)      from  ws-num-sorteado(04).
           05  sc-num-sort     line 08 col 15 pic 9(02)      from  ws-num-sorteado(05).
           05  sc-num-sort     line 08 col 18 pic 9(02)      from  ws-num-sorteado(06).
           05  sc-tempo        line 11 col 03 pic z9,99.99   from  ws-time.
           05  sc-sorteio      line 14 col 03 pic zzzzzzzzzzzzzz9          from  ws-q-vezes-sorteio.


       01  sc-tela-menu-aposta-07.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-         Sorteio Mega Sena - 07 numeros                --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Digite os 07 numeros da aposta:                       --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "- num1[  ] num2[  ] num3[  ] num4[  ] num5[  ] num6[  ] --".
           05  line 07 col 01 value "- num7[  ]                                              --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "-                                                       --".
           05  line 12 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)   using ls-voltar-menu.
           05  sc-num-01       line 06 col 08 pic 9(02)   using ws-numero(01).
           05  sc-num-02       line 06 col 17 pic 9(02)   using ws-numero(02).
           05  sc-num-03       line 06 col 26 pic 9(02)   using ws-numero(03).
           05  sc-num-04       line 06 col 35 pic 9(02)   using ws-numero(04).
           05  sc-num-05       line 06 col 44 pic 9(02)   using ws-numero(05).
           05  sc-num-06       line 06 col 53 pic 9(02)   using ws-numero(06).
           05  sc-num-07       line 07 col 08 pic 9(02)   using ws-numero(07).
           05  sc-mensagem1    line 09 col 07 pic x(40)   from  ws-mensagem1 foreground-color 12.
           05  sc-mensagem2    line 10 col 07 pic x(40)   from  ws-mensagem2 foreground-color 12.


       01  sc-tela-fim-aposta07.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-                  Sorteio Mega Sena                    --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Numeros de entrada:                                   --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "-                                                       --".
           05  line 07 col 01 value "- Numeros Sorteados:                                    --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "- Tempo Sorteio:                                        --".
           05  line 11 col 01 value "-                                                       --".
           05  line 12 col 01 value "-                                                       --".
           05  line 13 col 01 value "- Quantidade de sorteios:                               --".
           05  line 14 col 01 value "-                                                       --".
           05  line 15 col 01 value "-                                                       --".
           05  line 16 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)      using ls-voltar-menu.
           05  sc-num-01       line 05 col 03 pic 9(02)      from  ws-numero(01).
           05  sc-num-02       line 05 col 06 pic 9(02)      from  ws-numero(02).
           05  sc-num-03       line 05 col 09 pic 9(02)      from  ws-numero(03).
           05  sc-num-04       line 05 col 12 pic 9(02)      from  ws-numero(04).
           05  sc-num-05       line 05 col 15 pic 9(02)      from  ws-numero(05).
           05  sc-num-06       line 05 col 18 pic 9(02)      from  ws-numero(06).
           05  sc-num-07       line 05 col 21 pic 9(02)      from  ws-numero(07).
           05  sc-num-sort     line 08 col 03 pic 9(02)      from  ws-num-sorteado(01).
           05  sc-num-sort     line 08 col 06 pic 9(02)      from  ws-num-sorteado(02).
           05  sc-num-sort     line 08 col 09 pic 9(02)      from  ws-num-sorteado(03).
           05  sc-num-sort     line 08 col 12 pic 9(02)      from  ws-num-sorteado(04).
           05  sc-num-sort     line 08 col 15 pic 9(02)      from  ws-num-sorteado(05).
           05  sc-num-sort     line 08 col 18 pic 9(02)      from  ws-num-sorteado(06).
           05  sc-tempo        line 11 col 03 pic z9,99.99   from  ws-time.
           05  sc-sorteio      line 14 col 03 pic zzzzzzzzzzzzzz9          from  ws-q-vezes-sorteio.


       01  sc-tela-menu-aposta-08.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-         Sorteio Mega Sena - 08 numeros                --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Digite os 08 numeros da aposta:                       --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "- num1[  ] num2[  ] num3[  ] num4[  ] num5[  ] num6[  ] --".
           05  line 07 col 01 value "- num7[  ] num8[  ]                                     --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "-                                                       --".
           05  line 12 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)   using ls-voltar-menu.
           05  sc-num-01       line 06 col 08 pic 9(02)   using ws-numero(01).
           05  sc-num-02       line 06 col 17 pic 9(02)   using ws-numero(02).
           05  sc-num-03       line 06 col 26 pic 9(02)   using ws-numero(03).
           05  sc-num-04       line 06 col 35 pic 9(02)   using ws-numero(04).
           05  sc-num-05       line 06 col 44 pic 9(02)   using ws-numero(05).
           05  sc-num-06       line 06 col 53 pic 9(02)   using ws-numero(06).
           05  sc-num-07       line 07 col 08 pic 9(02)   using ws-numero(07).
           05  sc-num-08       line 07 col 17 pic 9(02)   using ws-numero(08).
           05  sc-mensagem1    line 09 col 07 pic x(40)   from  ws-mensagem1 foreground-color 12.
           05  sc-mensagem2    line 10 col 07 pic x(40)   from  ws-mensagem2 foreground-color 12.


       01  sc-tela-fim-aposta08.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-                  Sorteio Mega Sena                    --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Numeros de entrada:                                   --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "-                                                       --".
           05  line 07 col 01 value "- Numeros Sorteados:                                    --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "- Tempo Sorteio:                                        --".
           05  line 11 col 01 value "-                                                       --".
           05  line 12 col 01 value "-                                                       --".
           05  line 13 col 01 value "- Quantidade de sorteios:                               --".
           05  line 14 col 01 value "-                                                       --".
           05  line 15 col 01 value "-                                                       --".
           05  line 16 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)      using ls-voltar-menu.
           05  sc-num-01       line 05 col 03 pic 9(02)      from  ws-numero(01).
           05  sc-num-02       line 05 col 06 pic 9(02)      from  ws-numero(02).
           05  sc-num-03       line 05 col 09 pic 9(02)      from  ws-numero(03).
           05  sc-num-04       line 05 col 12 pic 9(02)      from  ws-numero(04).
           05  sc-num-05       line 05 col 15 pic 9(02)      from  ws-numero(05).
           05  sc-num-06       line 05 col 18 pic 9(02)      from  ws-numero(06).
           05  sc-num-07       line 05 col 21 pic 9(02)      from  ws-numero(07).
           05  sc-num-08       line 05 col 24 pic 9(02)      from  ws-numero(08).
           05  sc-num-sort     line 08 col 03 pic 9(02)      from  ws-num-sorteado(01).
           05  sc-num-sort     line 08 col 06 pic 9(02)      from  ws-num-sorteado(02).
           05  sc-num-sort     line 08 col 09 pic 9(02)      from  ws-num-sorteado(03).
           05  sc-num-sort     line 08 col 12 pic 9(02)      from  ws-num-sorteado(04).
           05  sc-num-sort     line 08 col 15 pic 9(02)      from  ws-num-sorteado(05).
           05  sc-num-sort     line 08 col 18 pic 9(02)      from  ws-num-sorteado(06).
           05  sc-tempo        line 11 col 03 pic z9,99.99   from  ws-time.
           05  sc-sorteio      line 14 col 03 pic zzzzzzzzzzzzzz9          from  ws-q-vezes-sorteio.


       01  sc-tela-menu-aposta-09.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-         Sorteio Mega Sena - 09 numeros                --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Digite os 09 numeros da aposta:                       --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "- num1[  ] num2[  ] num3[  ] num4[  ] num5[  ] num6[  ] --".
           05  line 07 col 01 value "- num7[  ] num8[  ] num9[  ]                            --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "-                                                       --".
           05  line 12 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)   using ls-voltar-menu.
           05  sc-num-01       line 06 col 08 pic 9(02)   using ws-numero(01).
           05  sc-num-02       line 06 col 17 pic 9(02)   using ws-numero(02).
           05  sc-num-03       line 06 col 26 pic 9(02)   using ws-numero(03).
           05  sc-num-04       line 06 col 35 pic 9(02)   using ws-numero(04).
           05  sc-num-05       line 06 col 44 pic 9(02)   using ws-numero(05).
           05  sc-num-06       line 06 col 53 pic 9(02)   using ws-numero(06).
           05  sc-num-07       line 07 col 08 pic 9(02)   using ws-numero(07).
           05  sc-num-08       line 07 col 17 pic 9(02)   using ws-numero(08).
           05  sc-num-09       line 07 col 26 pic 9(02)   using ws-numero(09).
           05  sc-mensagem1    line 09 col 07 pic x(40)   from  ws-mensagem1 foreground-color 12.
           05  sc-mensagem2    line 10 col 07 pic x(40)   from  ws-mensagem2 foreground-color 12.


       01  sc-tela-fim-aposta09.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-                  Sorteio Mega Sena                    --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Numeros de entrada:                                   --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "-                                                       --".
           05  line 07 col 01 value "- Numeros Sorteados:                                    --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "- Tempo Sorteio:                                        --".
           05  line 11 col 01 value "-                                                       --".
           05  line 12 col 01 value "-                                                       --".
           05  line 13 col 01 value "- Quantidade de sorteios:                               --".
           05  line 14 col 01 value "-                                                       --".
           05  line 15 col 01 value "-                                                       --".
           05  line 16 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)      using ls-voltar-menu.
           05  sc-num-01       line 05 col 03 pic 9(02)      from  ws-numero(01).
           05  sc-num-02       line 05 col 06 pic 9(02)      from  ws-numero(02).
           05  sc-num-03       line 05 col 09 pic 9(02)      from  ws-numero(03).
           05  sc-num-04       line 05 col 12 pic 9(02)      from  ws-numero(04).
           05  sc-num-05       line 05 col 15 pic 9(02)      from  ws-numero(05).
           05  sc-num-06       line 05 col 18 pic 9(02)      from  ws-numero(06).
           05  sc-num-07       line 05 col 21 pic 9(02)      from  ws-numero(07).
           05  sc-num-08       line 05 col 24 pic 9(02)      from  ws-numero(08).
           05  sc-num-09       line 05 col 27 pic 9(02)      from  ws-numero(09).
           05  sc-num-sort     line 08 col 03 pic 9(02)      from  ws-num-sorteado(01).
           05  sc-num-sort     line 08 col 06 pic 9(02)      from  ws-num-sorteado(02).
           05  sc-num-sort     line 08 col 09 pic 9(02)      from  ws-num-sorteado(03).
           05  sc-num-sort     line 08 col 12 pic 9(02)      from  ws-num-sorteado(04).
           05  sc-num-sort     line 08 col 15 pic 9(02)      from  ws-num-sorteado(05).
           05  sc-num-sort     line 08 col 18 pic 9(02)      from  ws-num-sorteado(06).
           05  sc-tempo        line 11 col 03 pic z9,99.99   from  ws-time.
           05  sc-sorteio      line 14 col 03 pic zzzzzzzzzzzzzz9          from  ws-q-vezes-sorteio.


       01  sc-tela-menu-aposta-10.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-         Sorteio Mega Sena - 10 numeros                --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Digite os 10 numeros da aposta:                       --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "- num1[  ] num2[  ] num3[  ] num4[  ] num5[  ] num6[  ] --".
           05  line 07 col 01 value "- num7[  ] num8[  ] num9[  ] num10[  ]                  --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "-                                                       --".
           05  line 12 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)   using ls-voltar-menu.
           05  sc-num-01       line 06 col 08 pic 9(02)   using ws-numero(01).
           05  sc-num-02       line 06 col 17 pic 9(02)   using ws-numero(02).
           05  sc-num-03       line 06 col 26 pic 9(02)   using ws-numero(03).
           05  sc-num-04       line 06 col 35 pic 9(02)   using ws-numero(04).
           05  sc-num-05       line 06 col 44 pic 9(02)   using ws-numero(05).
           05  sc-num-06       line 06 col 53 pic 9(02)   using ws-numero(06).
           05  sc-num-07       line 07 col 08 pic 9(02)   using ws-numero(07).
           05  sc-num-08       line 07 col 17 pic 9(02)   using ws-numero(08).
           05  sc-num-09       line 07 col 26 pic 9(02)   using ws-numero(09).
           05  sc-num-10       line 07 col 36 pic 9(02)   using ws-numero(10).
           05  sc-mensagem1    line 09 col 07 pic x(40)   from  ws-mensagem1 foreground-color 12.
           05  sc-mensagem2    line 10 col 07 pic x(40)   from  ws-mensagem2 foreground-color 12.


       01  sc-tela-fim-aposta10.
           05  blank screen.
           05  line 01 col 01 value "--------------------------------------- menu inicial [ ]--".
           05  line 02 col 01 value "-                  Sorteio Mega Sena                    --".
           05  line 03 col 01 value "-                                                       --".
           05  line 04 col 01 value "- Numeros de entrada:                                   --".
           05  line 05 col 01 value "-                                                       --".
           05  line 06 col 01 value "-                                                       --".
           05  line 07 col 01 value "- Numeros Sorteados:                                    --".
           05  line 08 col 01 value "-                                                       --".
           05  line 09 col 01 value "-                                                       --".
           05  line 10 col 01 value "- Tempo Sorteio:                                        --".
           05  line 11 col 01 value "-                                                       --".
           05  line 12 col 01 value "-                                                       --".
           05  line 13 col 01 value "- Quantidade de sorteios:                               --".
           05  line 14 col 01 value "-                                                       --".
           05  line 15 col 01 value "-                                                       --".
           05  line 16 col 01 value "----------------------------------------------------------".

           05  sc-voltar-menu  line 01 col 55 pic x(01)      using ls-voltar-menu.
           05  sc-num-01       line 05 col 03 pic 9(02)      from  ws-numero(01).
           05  sc-num-02       line 05 col 06 pic 9(02)      from  ws-numero(02).
           05  sc-num-03       line 05 col 09 pic 9(02)      from  ws-numero(03).
           05  sc-num-04       line 05 col 12 pic 9(02)      from  ws-numero(04).
           05  sc-num-05       line 05 col 15 pic 9(02)      from  ws-numero(05).
           05  sc-num-06       line 05 col 18 pic 9(02)      from  ws-numero(06).
           05  sc-num-07       line 05 col 21 pic 9(02)      from  ws-numero(07).
           05  sc-num-08       line 05 col 24 pic 9(02)      from  ws-numero(08).
           05  sc-num-09       line 05 col 27 pic 9(02)      from  ws-numero(09).
           05  sc-num-10       line 05 col 30 pic 9(02)      from  ws-numero(10).
           05  sc-num-sort     line 08 col 03 pic 9(02)      from  ws-num-sorteado(01).
           05  sc-num-sort     line 08 col 06 pic 9(02)      from  ws-num-sorteado(02).
           05  sc-num-sort     line 08 col 09 pic 9(02)      from  ws-num-sorteado(03).
           05  sc-num-sort     line 08 col 12 pic 9(02)      from  ws-num-sorteado(04).
           05  sc-num-sort     line 08 col 15 pic 9(02)      from  ws-num-sorteado(05).
           05  sc-num-sort     line 08 col 18 pic 9(02)      from  ws-num-sorteado(06).
           05  sc-tempo        line 11 col 03 pic z9,99.99   from  ws-time.
           05  sc-sorteio      line 14 col 03 pic zzzzzzzzzzzzzz9          from  ws-q-vezes-sorteio.



      *>--- declaração do corpo do programa
       procedure division using ls-tela-menu-principal.

           perform inicializacao.
           perform processamento.
           perform finalizacao.

      *>-----------------------------------------------------------------
      *>                   inicializacao do programa
      *>-----------------------------------------------------------------
       inicializacao section.

           *>display "inicializacao"

           .
       inicializacao-exit.
           exit.


      *>-----------------------------------------------------------------
      *>                   processamento do programa
      *>-----------------------------------------------------------------
       processamento section.


           set ls-n-voltar to true
           perform until ls-voltar *>voltar para o menu principal
               evaluate ls-quant-aposta
                   when = 6
                       perform aposta-06-numeros
                   when = 7
                       perform aposta-07-numeros
                   when = 8
                       perform aposta-08-numeros
                   when = 9
                       perform aposta-09-numeros
                   when other
                       perform aposta-10-numeros
               end-evaluate
           end-perform


           .
       processamento-exit.
           exit.


      *>-----------------------------------------------------------------
      *>                   finalizacao do programa
      *>-----------------------------------------------------------------
       finalizacao section.


           exit program


           .
       finalizacao-exit.
           exit.


      *>-----------------------------------------------------------------
      *>Aposta para 06 numeros
      *>-----------------------------------------------------------------
       aposta-06-numeros section.

           perform zerar-variaveis-numeros
           move space to               ls-voltar-menu
           set ws-nao-zero             to true
           set ws-rep-nao              to true
           set ws-verdadeiro-01-60     to true

           display                     sc-tela-menu-aposta-06
           accept                      sc-tela-menu-aposta-06

           perform until ls-voltar *>se for verdadeiro, volta para o menu
               if ls-voltar-menu <> space
                   set ls-voltar to true
               else
                   perform conf-num-1-60-e-repetidos
               end-if
           end-perform

           move space to ws-mensagem1
           move space to ws-mensagem2


           .
       aposta-06-numeros-exit.
           exit.



      *>-----------------------------------------------------------------
      *>Aposta para 07 numeros
      *>-----------------------------------------------------------------
       aposta-07-numeros section.

           perform zerar-variaveis-numeros
           move space to               ls-voltar-menu
           set ws-nao-zero             to true
           set ws-rep-nao              to true
           set ws-verdadeiro-01-60     to true

           display                     sc-tela-menu-aposta-07
           accept                      sc-tela-menu-aposta-07

           perform until ls-voltar *>se for verdadeiro, volta para o menu
               if ls-voltar-menu <> space
                   set ls-voltar to true
               else
                   perform conf-num-1-60-e-repetidos
               end-if
           end-perform

           move space to ws-mensagem1
           move space to ws-mensagem2


           .
       aposta-07-numeros-exit.
           exit.


      *>-----------------------------------------------------------------
      *>Aposta para 08 numeros
      *>-----------------------------------------------------------------
       aposta-08-numeros section.

           perform zerar-variaveis-numeros
           move space to               ls-voltar-menu
           set ws-nao-zero             to true
           set ws-rep-nao              to true
           set ws-verdadeiro-01-60     to true

           display                     sc-tela-menu-aposta-08
           accept                      sc-tela-menu-aposta-08

           perform until ls-voltar *>se for verdadeiro, volta para o menu
               if ls-voltar-menu <> space
                   set ls-voltar to true
               else
                   perform conf-num-1-60-e-repetidos
               end-if
           end-perform

           move space to ws-mensagem1
           move space to ws-mensagem2


           .
       aposta-08-numeros-exit.
           exit.


      *>-----------------------------------------------------------------
      *>Aposta para 09 numeros
      *>-----------------------------------------------------------------
       aposta-09-numeros section.

           perform zerar-variaveis-numeros
           move space to               ls-voltar-menu
           set ws-nao-zero             to true
           set ws-rep-nao              to true
           set ws-verdadeiro-01-60     to true

           display                     sc-tela-menu-aposta-09
           accept                      sc-tela-menu-aposta-09

           perform until ls-voltar *>se for verdadeiro, volta para o menu
               if ls-voltar-menu <> space
                   set ls-voltar to true
               else
                   perform conf-num-1-60-e-repetidos
               end-if
           end-perform

           move space to ws-mensagem1
           move space to ws-mensagem2


           .
       aposta-09-numeros-exit.
           exit.


      *>-----------------------------------------------------------------
      *>Aposta para 10 numeros
      *>-----------------------------------------------------------------
       aposta-10-numeros section.

           perform zerar-variaveis-numeros
           move space to               ls-voltar-menu
           set ws-nao-zero             to true
           set ws-rep-nao              to true
           set ws-verdadeiro-01-60     to true

           display                     sc-tela-menu-aposta-10
           accept                      sc-tela-menu-aposta-10
           perform until ls-voltar *>se for verdadeiro, volta para o menu
               if ls-voltar-menu <> space
                   set ls-voltar to true
               else
                   perform conf-num-1-60-e-repetidos
               end-if
           end-perform

           move space to ws-mensagem1
           move space to ws-mensagem2


           .
       aposta-10-numeros-exit.
           exit.


      *>-----------------------------------------------------------------
      *> zerar variaveis
      *>-----------------------------------------------------------------
       zerar-variaveis-numeros section.


           move 1 to ws-i
           perform until ws-i > ls-quant-aposta
               move 0 to ws-numero(ws-i)
               add 1 to ws-i
           end-perform


           .
       zerar-variaveis-numeros-exit.
           exit.


      *>-----------------------------------------------------------------
      *>                 num fora de 1-60 e repetidos
      *>-----------------------------------------------------------------
       conf-num-1-60-e-repetidos section.


           move space to ws-mensagem1
           move space to ws-mensagem2
           move 0 to ws-i
           move 0 to ws-s
           move 0 to ws-aux-num-1-60

           perform until ws-falso-01-60 or ws-aux-num-1-60 <> 0 or ws-rep-sim or ws-sim-zero

               perform numeros-igual-zero *>caso o usuario não digite nada e de enter
               perform intervalo-01-60    *>conferir se está no intervalo de 01-60

           end-perform

           if ws-rep-sim or ws-falso-01-60 or ws-sim-zero then *>condição para numeros repetidos, fora do intervalo ou = 0

               evaluate ls-quant-aposta
                   when = 6
                       perform aposta-06-numeros
                   when = 7
                       perform aposta-07-numeros
                   when = 8
                       perform aposta-08-numeros
                   when = 9
                       perform aposta-09-numeros
                   when other
                       perform aposta-10-numeros
               end-evaluate

           else
               display erase
               perform sorteio-numeros
           end-if


           .
       conf-num-1-60-e-repetidos-exit.
           exit.



      *>-----------------------------------------------------------------
      *>numero = 0, ou seja, usuario não digitou nada em alguma ou todas apostas
      *>-----------------------------------------------------------------
       numeros-igual-zero section.


           move 0 to ws-aux-igual-zero
           move 1 to ws-i

           perform until ws-i > ls-quant-aposta
               if ws-numero(ws-i) = 0 then
                   add 1 to ws-aux-igual-zero
               end-if
               add 1 to ws-i
           end-perform

           if ws-aux-igual-zero = ls-quant-aposta then *>nenhum numero foi digitado
               set ws-sim-zero to true
               move "Nao houve entrada de nenhum numero" to ws-mensagem1
           else
           if ws-aux-igual-zero <> 0 and ws-aux-igual-zero < ls-quant-aposta then
               set ws-sim-zero to true
               move "Nao houve entrada de todos os numeros" to ws-mensagem1
           else
               set ws-nao-zero to true
           end-if


           .
       numeros-igual-zero-exit.
           exit.


      *>-----------------------------------------------------------------
      *>conferir se numero está no intervalo entre 01-60
      *>-----------------------------------------------------------------
       intervalo-01-60 section.


           if ws-nao-zero then

               move 0 to ws-i
               perform ls-quant-aposta times *>conferir se esta no intervalo de 01-60
                   add 1 to ws-i
                   if ws-numero(ws-i) < 01 or ws-numero(ws-i) > 60 then
                       set ws-falso-01-60 to true
                       move "Aposta Fora Do Intervalo 01-60"   to ws-mensagem1
                   else
                       add 1 to ws-aux-num-1-60 *>tratamento para caso as duas condições sejam falsas,
                                                *>não entrar em loop infinito dentro deste perform
                   end-if
               end-perform
               perform numeros-repetidos *>conferir se há numeros repetidos

            end-if

           .
       intervalo-01-60-exit.
           exit.


      *>-----------------------------------------------------------------
      *>conferir se há numeros repetidos
      *>-----------------------------------------------------------------
       numeros-repetidos section.


           move 0 to ws-i
           perform 1 times
               perform until ws-i = ls-quant-aposta
                   add 1 to ws-i
                   move 0 to ws-s

                   perform until ws-s = ls-quant-aposta
                       add 1 to ws-s
                       if ws-numero(ws-i) = ws-numero(ws-s) and ws-i <> ws-s then
                           set ws-rep-sim to true
                           move "Aposta Com Numeros Repetidos "    to ws-mensagem2
                       end-if
                   end-perform
               end-perform
           end-perform


           .
       numeros-repetidos-exit.
           exit.


      *>-----------------------------------------------------------------
      *>sorteio dos numeros
      *>-----------------------------------------------------------------
       sorteio-numeros section.

           move function current-date to ws-inicio-temp-execucao
           move 0 to ws-q-vezes-sorteio
           move 0 to ws-numeros-acertados

           display "   -- Numeros Sorteados --"
           perform until ws-numeros-acertados = 6

               perform sortear-num
               perform conferir-acertos-jogo

               display ws-num-sorteado(1) " - " ws-num-sorteado(2) " - " ws-num-sorteado(3) " - " ws-num-sorteado(4) " - " ws-num-sorteado(5) " - " ws-num-sorteado(6)

           end-perform

           move function current-date to ws-fim-temp-execucao
           perform calcular-time

           move space to   ls-voltar-menu

           evaluate ls-quant-aposta
               when = 6
                   display         sc-tela-fim-aposta06
                   accept          sc-tela-fim-aposta06
               when = 7
                   display         sc-tela-fim-aposta07
                   accept          sc-tela-fim-aposta07
               when = 8
                   display         sc-tela-fim-aposta08
                   accept          sc-tela-fim-aposta08
               when = 9
                   display         sc-tela-fim-aposta09
                   accept          sc-tela-fim-aposta09
               when other
                   display         sc-tela-fim-aposta10
                   accept          sc-tela-fim-aposta10
           end-evaluate


           .
       sorteio-numeros-exit.
           exit.


      *>-----------------------------------------------------------------
      *> sortar numeros
      *>-----------------------------------------------------------------
       sortear-num section.  *> delay de 1 centésimo de segundo


           set ws-num-igual to true
           perform until ws-num-n-igual

               perform semente-delay
               compute  ws-num-sorteado(1) =  function random(ws-semente) * 60

               perform semente-delay
               compute  ws-num-sorteado(2) =  function random(ws-semente + ws-num-sorteado(1)) * 60

               perform semente-delay
               compute  ws-num-sorteado(3) =  function random(ws-semente + ws-num-sorteado(2)) * 60

               perform semente-delay
               compute  ws-num-sorteado(4) =  function random(ws-semente + ws-num-sorteado(3)) * 60

               perform semente-delay
               compute  ws-num-sorteado(5) =  function random(ws-semente + ws-num-sorteado(4)) * 60

               perform semente-delay
               compute  ws-num-sorteado(6) =  function random(ws-semente + ws-num-sorteado(5)) * 60

               set ws-num-n-igual to true
               perform conf-sorteio-num-iguais *>conferir se possuem numeros sorteados iguais

           end-perform


           .
       sortear-num-exit.
           exit.


      *>-----------------------------------------------------------------
      *> delay do sorteio
      *>-----------------------------------------------------------------
       semente-delay section.  *> delay de 1 centésimo de segundo


           perform 10 times
               accept ws-semente1 from time
               move ws-semente1    to ws-semente
               perform until ws-semente > ws-semente1
                   accept ws-semente from time
               end-perform
           end-perform


           .
       semente-delay-exit.
           exit.


      *>-----------------------------------------------------------------
      *> conferir se tem numeros iguais no sorteio
      *>-----------------------------------------------------------------
       conf-sorteio-num-iguais section.


           move 0 to ws-i
           perform until ws-i = 6
               add 1 to ws-i
               move 0 to ws-s
               perform until ws-s = 6
                   add 1 to ws-s
                   if ws-num-sorteado(ws-i) = ws-num-sorteado(ws-s) and ws-i <> ws-s or ws-num-sorteado(ws-i) = 0 then
                       set ws-num-igual to true
                   end-if
               end-perform
           end-perform

           .
       conf-sorteio-num-iguais-exit.
           exit.


      *>-----------------------------------------------------------------
      *> conferir acertos do jogador
      *>-----------------------------------------------------------------
       conferir-acertos-jogo section.


           move 0 to ws-numeros-acertados
           move 0 to ws-i
           perform until ws-i = ws-quant-num-sorteados
               add 1 to ws-i
               move 0 to ws-s
               perform until ws-s = ls-quant-aposta
                   add 1 to ws-s
                   if ws-num-sorteado(ws-i) = ws-numero(ws-s) and ws-i <> ws-s then
                       add 1 to ws-numeros-acertados
                   end-if
               end-perform
           end-perform
           add 1 to ws-q-vezes-sorteio *> contagem de quantas vezes executou o sorteio até acertar


           .
       conferir-acertos-jogo-exit.
           exit.


      *>-----------------------------------------------------------------
      *> calcular time
      *>-----------------------------------------------------------------
       calcular-time section.


           compute ws-time-hora   = ws-fhora - ws-hora
           compute ws-time-minuto = ws-fminuto - ws-minuto
           compute ws-time-centesimo = ws-fcentesimo-segundo - ws-centesimo-segundo


           .
       calcular-time-exit.
           exit.

