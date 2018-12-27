#language: pt

@listar_compras_invalida
Funcionalidade: Listar Compras Invalidas

Cenário: Listar compra invalidas
	Dado que realizo uma busca na api
	Quando informar a quantidade de pedidos
	Então devo visualizar o pedido invalido com a mensagem "\"O atributo 'idCompraBandeira' não pode ser nulo e deve ser maior do que zero.\""

Cenário: Listar compra por idCompraBandeira
	Dado que realizo uma busca na api
	Quando informar o idCompraBandeira "1377596011"
	Então devo visualizar o pedido invalido com a mensagem "\"O atributo 'idUnidadeNegocio' não pode ser nulo e deve ser maior do que zero.\""

Cenário: Campo id invalido
  Dado que realizo uma busca na api
  Quando informar o idCompraBandeira "sdfs"
  Então devo visualizar a mensagem "Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'; nested exception is java.lang.NumberFormatException: For input string: \"sdfs\""