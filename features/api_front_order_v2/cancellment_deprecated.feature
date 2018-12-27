#language: pt

@cancelamento
Funcionalidade: Cancelar pedido

@sucesso @cancelamento
Esquema do Cenário: Cancelar pedido com sucesso
  Dado que eu possua um pedido com status "<status>"
  Quando eu realizar o cancelamento do pedido pela api-front
  Então meu pedido deve ser "CAN"
Exemplos:
  |status |
  |PEN    |
  |PAY    |

@erro @cancelamento
Esquema do Cenário: Não realizar cancelamento do pedido
  Dado que eu possua um pedido com status "<status>"
  Quando eu realizar o cancelamento do pedido pela api-front
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