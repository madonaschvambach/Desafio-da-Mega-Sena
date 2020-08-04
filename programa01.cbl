      $set sourceformat"free"

      *>--- divisão de identificação do programa
       identification division.
      *>--- nome do programa
       program-id. "esqueleto".
      *>--- nome do autor
       author. "Madona Schvambach".
       installation. "PC".
      *>--- data que o programa foi escrito
       date-written. 21/07/2020.
       date-compiled. 21/07/2020.

      *>--- divisao para configuração do programa
       environment division.
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

       01  ws-tela-menu-principal.
           05  ws-quant-aposta                     pic 9(02).
           05  ws-mensagem                         pic x(40).
           05  ws-sair-programa                    pic x(01).
               88  ws-continuar                    value space.
               88  ws-sair                         value "x" "X".
           05  ws-voltar-menu                      pic x(01) value space.
               88  ws-voltar                       value "x" "X".
               88  ws-n-voltar                     value space.


       77  aux_erase                               pic 9(01).

      *>--- variaveis para comunicaçao entre programa
       linkage section.

      *>--- declaração de tela
       screen section.


       01  tela-menu-principal.
           05  blank screen.
           05  line 01 col 01 value "---------------------------------------------  sair[ ] -".
           05  line 02 col 01 value "-                  Sorteio Mega Sena                   -".
           05  line 03 col 01 value "-                                                      -".
           05  line 04 col 01 value "- Entre com a quantidade de numeros da aposta:         -".
           05  line 05 col 01 value "- Voce pode escolher: 6, 7, 8, 9 ou 10.                -".
           05  line 06 col 01 value "-                                                      -".
           05  line 07 col 01 value "- Quantidade de numeros: [  ]                          -".
           05  line 08 col 01 value "-                                                      -".
           05  line 09 col 01 value "-                                                      -".
           05  line 10 col 01 value "--------------------------------------------------------".

           05  sc-sair-tela-menu           line 01 col 53  pic x(01)   using ws-sair-programa.
           05  sc-quant-aposta             line 07 col 27  pic 9(02)   using ws-quant-aposta.
           05  sc-mrensagem-n-invalido     line 09 col 14  pic x(40)   from  ws-mensagem.

      *>--- declaração do corpo do programa
       procedure division.

           perform inicializacao.
           perform processamento.
           perform finalizacao.

      *>-----------------------------------------------------------------
      *>                   inicializacao do programa
      *>-----------------------------------------------------------------
       inicializacao section.


           .
       inicializacao-exit.
           exit.

      *>-----------------------------------------------------------------
      *>                   processamento do programa
      *>-----------------------------------------------------------------

       processamento section.


           perform until   ws-sair
               if ws-sair-programa <> space then *>usuario digitou outra letra para sair e não o "x", but, sai mesmo assim
                   set ws-sair to true
               else
                   move space  to ws-sair-programa
                   move 0      to ws-quant-aposta

                   display tela-menu-principal
                   accept  tela-menu-principal

                   if ws-quant-aposta >= 6 and ws-quant-aposta <= 10 then
                       call "programa02" using ws-tela-menu-principal
                       move space  to ws-mensagem
                   else
                       move "Numero fora do intervalo 6 - 10." to ws-mensagem
                   end-if
               end-if
           end-perform




           .
       processamento-exit.
           exit.

      *>-----------------------------------------------------------------
      *>                   finalizacao do programa
      *>-----------------------------------------------------------------
       finalizacao section.

           display erase
           display "--fim--"
           stop run

           .
       finalizacao-exit.
           exit.

      *>-----------------------------------------------------------------
      *>                 blocos de comando do programa
      *>-----------------------------------------------------------------





