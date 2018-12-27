#language: pt

@listar_compras_v1
Funcionalidade: Listar Compras

@obrigatorio_v1
Cenário: Listar compras com valor obrigatório
	Dado que realizo uma busca na api
	Quando informar o lojista "11077" na api antiga
	Então devo visualizar as compras da api antiga

@falha_obrigatorio_v1
Esquema do Cenário: Falha de campo obrigatório
	Dado que realizo uma busca na api
	Quando informar o lojista "<lojista>" na api antiga
	Então devo visualizar uma mensagem de erro <mensagem> da api antiga
Exemplos:
	|lojista		|mensagem																																															|
	|						|"Erro findCompra: \"O atributo 'storeQualifierId' não pode ser nulo e deve ser maior do que zero.\""	|
	|-3					|"Erro findCompra: \"O atributo 'storeQualifierId' não pode ser nulo e deve ser maior do que zero.\""	|
	|sadasdadasd|"nested exception is java.lang.NumberFormatException: For input string: \"sadasdadasd\"]"						|

@nulo_obrigatorio_v1
Cenário: Campo obrigatório nulo
	Dado que realizo uma busca na api
	Quando informar o lojista nulo na api antiga
	Então devo verificar a mensagem "Erro findCompra: \"O atributo 'storeQualifierId' não pode ser nulo e deve ser maior do que zero.\"" com status code 400 na api antiga

@filtros_v1
Esquema do Cenário: Listar compras
	Dado que realizo uma busca na api
	Quando informar o filtro "<filtro>" com valor "<valor>" do lojista "11077" na api antiga
	Então devo visualizar as compras da api antiga
Exemplos:
	|filtro							|valor												|
	|orderId						|694													|
	|orderMasterId			|147108986										|
	|email							|vinicius.cosmi@teste.com			|
	|documentNr					|32799320848									|
	|startRow						|1														|
	|pageRows						|1														|
	|minDate						|2018-01-21T13:10:00Z					|
	|status							|APPROVED											|
	|estimatedDate			|5														|
	|approvalDate				|2018-02-21T13:10:00Z					|
	|customerName				|Vinicius											|
	|orderOwnerTp				|4														|
	|maxPurchaseDt			|2018-02-21T13:10:00Z					|
	|freightTime				|5														|
	
@filtros_com_erro_v1
Esquema do Cenário: Listar compras com filtros com caracter especial
	Dado que realizo uma busca na api
	Quando informar o filtro "<filtro>" com valor "<valor>" na api antiga
	Então devo verificar a mensagem "<mensagem>" com status code <status> na api antiga
Exemplos:
	|filtro				|valor	|mensagem																																														|status	|
	|orderId			|%24		|Field error in object 'getCompraV1Rest' on field 'orderId'																					|400		|
	|orderMasterId|%24		|Field error in object 'getCompraV1Rest' on field 'orderMasterId'																		|400		|
	|startRow			|%24		|Field error in object 'getCompraV1Rest' on field 'startRow'																				|400		|
	|pageRows			|%24		|Field error in object 'getCompraV1Rest' on field 'pageRows'																				|400		|
	|minDate			|%24		|Erro findCompra: null																																							|400		|
	|status				|%24		|Erro findCompra: \"O atributo 'status' é inválido, informe um status válido.\"											|400		|
	|estimatedDate|%24		|Erro findCompra: \"O atributo 'estimatedDate' é inválido, informe a quantidade de dias (ex: 10).\"	|400		|
	|approvalDate	|%24		|Erro findCompra: null																																							|400		|
	|orderOwnerTp	|%24		|Field error in object 'getCompraV1Rest' on field 'orderOwnerTp'																		|400		|
	|maxPurchaseDt|%24		|Erro findCompra: null																																							|400		|
	|freightTime	|%24		|Erro findCompra: \"O atributo 'freightTime' é inválido, informe a quantidade de dias (ex: 10).\"		|400		|

@filtros_caracter_especial_v1
Esquema do Cenário: Listar compras com filtros com caracter especial sem mensagem
	Dado que realizo uma busca na api
	Quando informar o filtro "<filtro>" com valor "<valor>" na api antiga
	Então devo verificar a mensagem de retorno com status code <status> na api antiga
Exemplos:
	|filtro				|valor|status	|
	|email				|%24	|200		|
	|documentNr		|%24	|200		|
	|customerName	|%24	|200		|
