#language: pt

@cancelamento
Funcionalidade: Cancelamento de item do pedido

@sucesso @cancelamento @item
Esquema do Cenário: Cancelar item com sucesso
  Dado que eu possua um pedido com status "<status>"
  Quando eu realizar o cancelamento do item do pedido
  Então meu pedido deve ser "CAN"
Exemplos:
  |status |
  |PEN    |
  |PAY    |

@erro @cancelamento @item
Esquema do Cenário: Não realizar cancelamento de item
  Dado que eu possua um pedido com status "<status>"
  Quando eu realizar o cancelamento do item do pedido
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

@sucesso @cancelamento @multi_itens
Esquema do Cenario: Cancelamento atualizando apenas 1 item
  Dado que eu possua um pedido com dois itens com status "<status>"
  Quando eu realizar o cancelamento do item do pedido
  Então meu pedido deve ser "PSH"
Exemplos:
|status|
|PAY   |