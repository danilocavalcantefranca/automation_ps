#language: pt

@cancelamento
Funcionalidade: Cancelar pedido

@sucesso
Esquema do Cenário: Cancelar pedido com sucesso 
  Dado que eu possua um pedido com status "<status>"
  Quando eu realizar o cancelamento do pedido
  Então meu pedido deve ser "CAN"
Exemplos:
  |status |
  |PEN    |
  |PAY    |

@erro
Esquema do Cenário: Não realizar cancelamento do pedido
  Dado que eu possua um pedido com status "<status>"
  Quando eu realizar o cancelamento do pedido
  Então meu pedido não deve ser cancelado
Exemplos:
  |status |
  |CAN    |
  |PSH    |
  |SHP    |
  |PDL    |
  |DLV    |
  |WMS    |
  |ROT    |
  |ARL    |