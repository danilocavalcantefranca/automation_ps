#language: pt

@listar_compras_master_id
Funcionalidade: Listar Compras

Cenário: Falha de campo lojista
	Dado que realizo uma busca na api
	Quando informar o lojista "testeErro" na api para listar compra por master id
	Então devo visualizar uma mensagem de erro "nested exception is java.lang.NumberFormatException: For input string: \"testeErro\"]"

Esquema do Cenário: Listar compras
	Dado que realizo uma busca na api
	Quando informar o filtro "<filtro>" com valor "<valor>" do lojista "11077" na api para listar compra por master id
	Então devo visualizar as compras da api para listar compra por master id
Exemplos:
	|filtro							|valor												|
	|orderId						|694													|
	|orderMasterId			|147108986										|
	|email							|vinicius.cosmi@teste.com			|
	|documentNr					|32799320848									|
	|customerName				|Vinicius Cosmi						 		|
	
Esquema do Cenário: Listar compras com filtros com caracter especial
	Dado que realizo uma busca na api
	Quando informar o filtro "<filtro>" com valor "<valor>" do lojista "11077" na api para listar compra por master id
	Então devo verificar a mensagem "<mensagem>" com status code <status> na api antiga
Exemplos:
	|filtro				|valor	|mensagem																																			|status	|
	|orderId			|%24		|Field error in object 'getCompraGroupByMasterIdRest' on field 'orderId'			|400		|
	|orderMasterId|%24		|Field error in object 'getCompraGroupByMasterIdRest' on field 'orderMasterId'|400		|
	|startRow			|%24		|Field error in object 'getCompraGroupByMasterIdRest' on field 'startRow'			|400		|
	|pageRows			|%24		|Field error in object 'getCompraGroupByMasterIdRest' on field 'pageRows'			|400		|
	|minDate			|%24		|Field error in object 'getCompraGroupByMasterIdRest' on field 'minDate'			|400		|

Esquema do Cenário: Listar compras com filtros com caracter especial sem mensagem
	Dado que realizo uma busca na api
	Quando informar o filtro "<filtro>" com valor "<valor>" do lojista "11077" na api para listar compra por master id
	Então devo verificar a mensagem de retorno com status code <status> na api antiga
Exemplos:
	|filtro				|valor|status	|
	|email				|%24	|200		|
	|documentNr		|%24	|200		|
	|customerName	|%24	|200		|
