#language: pt

@ar2
Funcionalidade: Enviar segundo email de aviso de retira na loja

@ar2 @sucesso
Cenário: Marcar pedido com status AR2
  Dado que eu possua pedido com status "ARL" a 3 dias
  Quando realizar a requisição do endpoint para atuailizar o pedido ARL
  Então devo receber status code 200
  E meu pedido deve ter sido atualizado para o status "AR2"

@ar2 @erro_data
Cenário: Marcar pedido com status AR2 com data diferente
  Dado que eu possua pedido com status "ARL" com data diferente
  Quando realizar a requisição do endpoint para atuailizar o pedido ARL
  Então devo receber status code 200
  E meu pedido não deve ter sido atualizado para o status "AR2"

@ar2 @erro_status
Esquema do Cenário: Marcar pedido com status AR2 com status diferente de ARL
  Dado que eu possua pedido com status "<status>"
  Quando realizar a requisição do endpoint para atuailizar o pedido ARL
  Então devo receber status code 200
  E meu pedido não deve ter sido atualizado para o status "AR2"
Exemplos:
  |status |
  |PEN    |
  |PAY    |
  |SHP    |
  |PSH    |
  |DLV    |
  |PDL    |
  |WMS    |
  |ROT    |
  |AR2    |