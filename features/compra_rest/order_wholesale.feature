#language: pt

@listar_compras_atacado
Funcionalidade: Listar Compras Atacado

@sem_filtro
Cenário: Listar compra atacado apenas por quantidade
	Dado que realizo uma busca na api
	Quando informar a quantidade de itens da pagina
	Então devo visualizar os pedidos do tipo "ATACADO"

@filtro_simples
Esquema do Cenário: Listar compra atacado por filtro
	Dado que realizo uma busca na api
	Quando consultar de pedido atacado com o filtro "<filtro>" e com valor "<valor>"
	Então devo visualizar os pedidos do tipo "ATACADO"
Exemplos: 
	|filtro							|valor			|
	|nomeCliente				|Dani		    |
	|documentoCliente		|1252913370 |
	|idCompraBandeira		|224466607	|
	|tempoPrazoEstimado	|0					|
	|idUnidadeNegocio		|4					|
	|status							|SHP				|
	|dataInicio					|01/01/2016	|
	|dataFim						|01/04/2018	|

@filtro_data
Esquema do Cenário: Listar compras por filtro de data
	Dado que realizo uma busca na api
	Quando consultar a "<data>" do pedido atacado com valor "<valor>" mais "<status>"
	Então devo visualizar os pedidos do tipo "ATACADO"
Exemplos: 
	|data												|valor			|status	|
	|dataInicialCompraAprovada	|01/01/2016	|PAY		|
	|dataFinalCompraAprovada		|01/04/2018	|PAY		|
	|dataInicialCompraCancelada	|01/01/2016	|CAN		|
	|dataFinalCompraCancelada		|01/01/2018	|CAN		|
	|dataInicialCompraEntregue	|01/01/2016	|DLV		|
	|dataFinalCompraEntregue		|01/01/2018	|DLV		|
	|dataInicialCompraEnviada		|01/01/2016	|SHP		|
	|dataFinalCompraEnviada			|01/01/2018	|SHP		|

@filtro_ordem
Esquema do Cenário: Listar compras por filtro de ordem
	Dado que realizo uma busca na api
	Quando consultar por "<valor>" e ordem "<ordem>" o pedido atacado
	Então devo visualizar os pedidos do tipo "ATACADO"
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