#language: pt

@pedido_aprovado_pap
Funcionalidade: Listar Pedidos com status PAP a 15 dias

@valido
Cenário: Listar pedidos com status PAP a 15 dias
	Dado que realizo uma busca na api
	Quando buscar um pedido "62345201"
	Então devo visualizar esse pedido

@invalido
Esquema do Cenário: Busca passando caracter invalido no campo data
	Dado que realizo uma busca na api
	Quando passar um caracter invalido
	Entao devera exibir "<mensagem>" de erro
Exemplos:
|mensagem|
|Erro ao fazer o parse da Data|
@sem_dados
Cenário: Validar que não retorna dados fora da data esperada
	Dado que realizo uma busca na api
	Quando passar uma data diferente da esperada
	Então não deve retornar dados

@status_pedidos_diferentes_pap
Esquema do Cenário: Validar que não retorne pedidos com status diferente de pap
	Dado que realizo uma busca na api
	Quando buscar um pedido "<pedido>"
	Então não deve retornar o pedido informado
Exemplos:
	|pedido	|	
	|570		|	#CAN
	|694		|	#PEN
	|576		| #ETR
	|646		| #ENT
	