#language: pt

@listar_compras_v2
Funcionalidade: Listar Compras

@obrigatorio_v2
Cenário: Listar compras com valor obrigatório
	Dado que realizo uma busca na api v2
	Quando informar o lojista "11077"
	Então devo visualizar as compras

@falha_obrigatorio_v2
Esquema do Cenário: Falha de campo obrigatório
	Dado que realizo uma busca na api v2
	Quando informar o lojista "<lojista>"
	Então devo visualizar uma mensagem de erro <mensagem>
Exemplos:
	|lojista		|mensagem																																									|
	|						|"\"O id do lojista é nulo ou menor que zero.\""																					|
	|-3					|"\"O id do lojista é nulo ou menor que zero.\""																					|
	|sadasdadasd|"nested exception is java.lang.NumberFormatException: For input string: \"sadasdadasd\"]"|

@nulo_obrigatorio_v2
Cenário: Campo obrigatório nulo
	Dado que realizo uma busca na api v2
	Quando informar o lojista nulo
	Então devo visualizar uma mensagem de erro

@filtros_v2
Esquema do Cenário: Listar compras
	Dado que realizo uma busca na api v2
	Quando informar o filtro "<filtro>" com valor "<valor>"
	Então devo visualizar as compras de acordo com o filtro
Exemplos:
	|filtro							|valor												|
	|freightTime				|5														|
	|customerName				|Vinicius											|
	|documentNr					|32799320848									|
	|orderMasterId			|139669199										|
	|approvedAt					|2018-02-21T13:10:00.000-03:00|
	|startApprovedDate	|2018-02-21T13:10:00.000-03:00|
	|finishApprovedDate	|2018-02-21T13:10:00.000-03:00|
	|minDate						|2018-02-21T13:10:00.000-03:00|
	|startPurchaseDate	|2018-02-21T13:10:00.000-03:00|
	|finishPurchaseDate	|2018-02-21T13:10:00.000-03:00|
	|startCanceledDate	|2018-02-21T13:10:00.000-03:00|
	|finishCanceledDate	|2018-02-21T13:10:00.000-03:00|
	|startDeliveyDate		|2018-02-21T13:10:00.000-03:00|
	|finishDeliveryDat	|2018-02-21T13:10:00.000-03:00|
	|startSentDate			|2018-02-21T13:10:00.000-03:00|
	|finishSentDat			|2018-02-21T13:10:00.000-03:00|
	|status							|APPROVED											|
	|orderId						|13966919901									|
	|startRow						|1														|
	|ordernarPor				|id														|
	|direction					|ASC													|
	|orderOwnerTp				|4														|

@filtros_caracter_especial_v2
Esquema do Cenário: Listar compras com filtros com caracter especial
	Dado que realizo uma busca na api v2
	Quando informar o filtro "<filtro>" com valor "<valor>"
	Então devo verificar a mensagem "<mensagem>" com status code <status>
Exemplos:
	|filtro							|valor	|mensagem	|status	|
	|customerName				|%24		|					|200		|
	|documentNr					|%24		|					|200		|
	|startApprovedDate	|%24		|					|200		|
	|finishApprovedDate	|%24		|					|200		|
	|startPurchaseDate	|%24		|					|200		|
	|finishPurchaseDate	|%24		|					|200		|
	|startCanceledDate	|%24		|					|200		|
	|finishCanceledDate	|%24		|					|200		|
	|startDeliveyDate		|%24		|					|200		|
	|finishDeliveryDat	|%24		|					|200		|
	|startSentDate			|%24		|					|200		|
	|finishSentDat			|%24		|					|200		|
	|ordernarPor				|%24		|					|200		|
	|direction					|%24		|					|200		|

@filtros_com_erro_v2
Esquema do Cenário: Listar compras com filtros incorretos
	Dado que realizo uma busca na api v2
	Quando informar o filtro "<filtro>" com valor "<valor>"
	Então devo verificar a mensagem "<mensagem>" com status code <status>
Exemplos:
	|filtro							|valor	|mensagem																													|status	|
	|freightTime				|%24		|Field error in object 'getCompraV2Rest' on field 'freightTime'		|400		|
	|orderMasterId			|16%696	|Field error in object 'getCompraV2Rest' on field 'orderMasterId'	|400		|
	|approvedAt					|%24		|Field error in object 'getCompraV2Rest' on field 'approvedAt'		|400		|
	|minDate						|%24		|Field error in object 'getCompraV2Rest' on field 'minDate'				|400		|
	|status							|%24		|Can not find any enum with status $															|400		|
	|orderId						|%24		|Field error in object 'getCompraV2Rest' on field 'orderId'				|400		|
	|startRow						|%24		|Field error in object 'getCompraV2Rest' on field 'startRow'			|400		|
	|orderOwnerTp				|%24		|Field error in object 'getCompraV2Rest' on field 'orderOwnerTp'	|400		|