#language: pt

@aprovar_pedido
Funcionalidade: Aprovar pedido

@sucesso
Esquema do Cenário: Aprovar pedido com sucesso
  Dado que a mensageria envie uma requisição para o mp-compras
  Quando informar os dados do pedido "PEN" com tipo "<typePayment>" 
  Então devo visualizar o status code 200 com registro na api da mensageria
Exemplos:
  |typePayment|
  |CREDIT_CARD|
  |BILL       |
  |DEBIT      |


@erro
Esquema do Cenário: Aprovar pedido com erro
  Dado que a mensageria envie uma requisição para o mp-compras
  Quando informar os dados do pedido "<status>" com tipo "<typePayment>"
  Então devo visualizar o status code 200 sem registro na api da mensageria
Exemplos:
  |status |typePayment|
  |PAY    |CREDIT_CARD|
  |CAN    |CREDIT_CARD|
  |PSH    |CREDIT_CARD|
  |SHP    |CREDIT_CARD|
  |PDL    |CREDIT_CARD|
  |DLV    |CREDIT_CARD|
  |WMS    |CREDIT_CARD|
  |ROT    |CREDIT_CARD|
  |ARL    |CREDIT_CARD|
  |PAY    |BILL       |
  |CAN    |BILL       | 
  |PSH    |BILL       |
  |SHP    |BILL       |
  |PDL    |BILL       |
  |DLV    |BILL       |
  |WMS    |BILL       |
  |ROT    |BILL       |
  |ARL    |BILL       |
  |PAY    |DEBIT      |
  |CAN    |DEBIT      |
  |PSH    |DEBIT      |
  |SHP    |DEBIT      |
  |PDL    |DEBIT      |
  |DLV    |DEBIT      |
  |WMS    |DEBIT      |
  |ROT    |DEBIT      |
  |ARL    |DEBIT      |