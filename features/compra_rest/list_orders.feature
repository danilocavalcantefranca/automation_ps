#language: pt

@listar_compras
Funcionalidade: Listar Compras

@sem_filtro
Cenário: Listar compras
	Dado que realizo uma busca na api
	Quando informar a quantidade de itens
	Então devo visualizar os pedidos do tipo "NORMAL"

@filtro_simples
Esquema do Cenário: Listar compras por filtro
	Dado que realizo uma busca na api
	Quando consultar o filtro "<filtro>" e com valor "<valor>"
	Então devo visualizar os pedidos do tipo "NORMAL"
Exemplos: 
	|filtro							|valor					|
	|nomeCliente				|Teste Arranjo	|
	|documentoCliente		|937.314.600-92	|
	|idCompraBandeira		|8000099				|
	|tempoPrazoEstimado	|3							|
	|idUnidadeNegocio		|3							|
	|status							|SHP						|
	|dataInicio					|01/01/2016			|
	|dataFim						|10/09/2018			|

@filtro_data
Esquema do Cenário: Listar compras por filtro de data
	Dado que realizo uma busca na api
	Quando consultar a "<data>" com valor "<valor>" mais "<status>"
	Então devo visualizar os pedidos do tipo "NORMAL"
Exemplos: 
	|data												|valor			|status	|
	|dataInicialCompraAprovada	|01/01/2016	|PAY		|
	|dataFinalCompraAprovada		|01/01/2018	|PAY		|
	|dataInicialCompraCancelada	|01/01/2016	|CAN		|
	|dataFinalCompraCancelada		|01/01/2018	|CAN		|
	|dataInicialCompraEntregue	|01/01/2016	|DLV		|
	|dataFinalCompraEntregue		|01/01/2018	|DLV		|
	|dataInicialCompraEnviada		|01/01/2016	|SHP		|
	|dataFinalCompraEnviada			|01/01/2018	|SHP		|

@filtro_ordem
Esquema do Cenário: Listar compras por filtro de ordem
	Dado que realizo uma busca na api
	Quando consultar por "<valor>" e ordem "<ordem>"
	Então devo visualizar os pedidos do tipo "NORMAL"
Exemplos: 
	|valor						|ordem|
	|id								|ASC	|
	|id								|DESC	|
	|idCompraBandeira	|ASC	|
	|idCompraBandeira	|DESC	|
	|idUnidadeNegocio	|ASC	|
	|idUnidadeNegocio	|DESC	|
	|idListaCompra		|ASC	|
	|idListaCompra		|DESC	|
	|data							|ASC	|
	|data							|DESC	|
	|valor						|ASC	|
	|valor						|DESC	|
	|valorFrete				|ASC	|
	|valorFrete				|DESC	|
	|desconto					|ASC	|
	|desconto					|DESC	|
	|valorTotal				|ASC	|
	|valorTotal				|DESC	|
	|tipoCompra				|ASC	|
	|tipoCompra				|DESC	|