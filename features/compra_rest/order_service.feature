#language: pt

@listar_compras_servico
Funcionalidade: Listar Compras Servico

@sem_filtro
Cenário: Listar compra servico simples
	Dado que realizo uma busca na api
	Quando realizar uma busca de pedido de servico
	Então devo visualizar os pedidos do tipo "SERVICO"

@filtro_simples
Esquema do Cenário: Listar compra servico por filtro
	Dado que realizo uma busca na api
	Quando consultar de pedido servico com o filtro "<filtro>" e com valor "<valor>"
	Então devo visualizar os pedidos do tipo "SERVICO"
Exemplos: 
	|filtro							|valor			|
	|nomeCliente				|Dani		    |
	|documentoCliente		|14890716874|
	|idCompraBandeira		|121555015	|
	|tempoPrazoEstimado	|0					|
	|idUnidadeNegocio		|4					|
	|status							|DLV				|
	|dataInicio					|01/01/2016	|
	|dataFim						|01/04/2018	|

@filtro_data
Esquema do Cenário: Listar compras por filtro de data
	Dado que realizo uma busca na api
	Quando consultar a "<data>" do pedido servico com valor "<valor>" mais "<status>"
	Então devo visualizar os pedidos do tipo "SERVICO"
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
	Quando consultar por "<valor>" e ordem "<ordem>" o pedido servico
	Então devo visualizar os pedidos do tipo "SERVICO"
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