#language: pt

@notificacao
Funcionalidade: Reenvio de notificação 62 e 63 para o front

@notificacao @62 
Cenário: Reenvio de notificacao 62
Dado que eu tenha uma notificação com erro de envio 62
Quando realizar o get no endpoint
Então devo receber status code 200
E devo ter aumentado meu numero de tentativas

@notificacao @62 @numero_pedido
Cenário: Reenvio de notificacao 62 informando o numero do pedido
Dado que eu tenha uma notificacao 62 e informe um numero de pedido
Quando realizar o get no endpoint passando o numero do pedido
Então devo receber status code 200
E devo ter aumentado meu numero de tentativas

@notificacao @63 
Cenário: Reenvio de notificacao 63
Dado que eu tenha uma notificação com erro de envio 63
Quando realizar o get no endpoint da 63
Então devo receber status code 200
E devo ter aumentado meu numero de tentativas

@notificacao @63 @numero_pedido
Cenário: Reenvio de notificacao 63 informando o numero do pedido
Dado que eu tenha uma notificacao 63 e informe um numero de pedido
Quando realizar o get no endpoint da 63 passando o numero do pedido
Então devo receber status code 200
E devo ter aumentado meu numero de tentativas