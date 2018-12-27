#language: pt

Funcionalidade: Cancelamento de pedido por Entrega

@cancelamento @entrega @pen
Cenário: Cancelar pedido por entrega PEN
	Dado que eu possua um pedido com status "PEN" com o sku 27265103
	E consulte o estoque do produto
	Quando realizar o cancelamento do pedido pela entrega
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PEN

@cancelamento @entrega @pay
Cenário: Cancelar pedido por entrega PEN
	Dado que eu possua um pedido com status "PAY" com o sku 27265103
	E consulte o estoque do produto
	Quando realizar o cancelamento do pedido pela entrega
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PAY

@cancelamento @sem_entrega
Cenário: Cancelar pedido sem entrega
	Dado que eu possua um pedido com status "PEN" com o sku 27265103
	E consulte o estoque do produto
	Quando realizar o cancelamento do pedido pela entrega sem passar a entrega
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PEN

@cancelamento @entrega @pen
Esquema do Cenário: Cancelar pedido informando idCompraEntrega ou idEntrega
	Dado que eu mande no payload um json com o campo "<campo>" com status "PEN" e sku 27265103
	E consulte o estoque do produto
	Quando realizar o cancelamento informando um dos campos
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PEN
	Exemplos:
	|campo|
	|idCompraEntrega|
	|idEntrega|

@cancelamento @entrega @pay
	Esquema do Cenário: Cancelar pedido informando idCompraEntrega ou idEntrega
	Dado que eu mande no payload um json com o campo "<campo>" com status "PAY" e sku 27265103
	E consulte o estoque do produto
	Quando realizar o cancelamento informando um dos campos
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PAY
	Exemplos:
	|campo|
	|idCompraEntrega|
	|idEntrega|

@cancelamento @entrega @origem_cancelamento
Esquema do Cenario: Cancelar pedido informando no campo origemCancelamento "L" ou "C"
	Dado que eu mande no payload um json com o campo origemCancelamento preenxido com o valor "<valor>" e pedido no status "PEN"
	Quando realizar o cancelamento do pedido pela entrega passando a origem do cancelamento
	Então meu pedido deve estar com status "CAN"	
	Exemplos:
	|valor|
	|C|
	|L|

@cancelamento @entrega @dois_itens_iguais @fluxo_antigo @pen
Cenario: Cancelar pedido com 2 itens do mesmo sku fluxo antigo
	Dado que eu possua um pedido com dois itens do mesmo SKU na mesma entrega com o status "PEN" e sku 27265103
	E consulte o estoque do produto
	Quando realizar o cancelamento do pedido pela entrega
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PEN baixando o estoque referente aos dois itens

@cancelamento @entrega @dois_itens_iguais @fluxo_antigo @pay
Cenario: Cancelar pedido com 2 itens do mesmo sku fluxo antigo
	Dado que eu possua um pedido com dois itens do mesmo SKU na mesma entrega com o status "PAY" e sku 27265103
	E consulte o estoque do produto
	Quando realizar o cancelamento do pedido pela entrega
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PAY baixando o estoque referente aos dois itens
	

@cancelamento @entrega @dois_itens_diferentes @fluxo_antigo @pen
Cenario: Cancelar pedido com 2 itens diferentes fluxo antigo
	Dado que eu possua um pedido com dois itens diferentes na mesma entrega com o status "PEN" e skus 27265103 e 22073421
	E consulte o estoque dos produtos
	Quando realizar o cancelamento do pedido pela entrega
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PEN baixando o estoque referente aos dois itens diferentes

@cancelamento @entrega @dois_itens_diferentes @fluxo_antigo @pay @abestado
Cenario: Cancelar pedido com 2 itens diferentes fluxo antigo
	Dado que eu possua um pedido com dois itens diferentes na mesma entrega com o status "PAY" e skus 27265103 e 22073421
	E consulte o estoque dos produtos
	Quando realizar o cancelamento do pedido pela entrega
	Então meu pedido deve estar com status "CAN"
	E estoque alterado conforme regra do status PAY baixando o estoque referente aos dois itens diferentes



Esquema do Cenario: Cancelar pedido com 2 itens diferentes fluxo antigo
	Dado que eu possua um pedido com 2 itens diferentes com o status "<status>"
	Quando realizar o cancelamento do pedido pela entrega
	Então meu pedido deve ser "CAN"
	E o pedido com status de "<status>"
Exemplos:
	|status|



Esquema do Cenário: Cancelar pedido com determinantes status sem entrega
	Dado que eu possua um pedido com status "<status>"
	Quando realizar o cancelamento do pedido pela entrega
	Então devo receber mensagem de violacao
Exemplos:
	|status|
	|PEN   |
	|PAY   |

Esquema do Cenário: Cancelar pedidos com status diferentes de PAY e PEN
	Dado que eu possua um pedido com status "<status>"
	Quando realizar o cancelamento do pedido pela entrega
	Então devo receber mensagem de violacao
Exemplos:
	|status|
	|SHP   |
	|DLV   |

Cenario: Cancelar pedido sem o campo idCompraBandeira
	Dado que eu mande no payload um json sem o campo idCompraBandeira
	Quando realizar o cancelamento do pedido pela entrega
	Então devo receber mensagem de violacao

Cenario: Cancelar pedido sem informar o idLojista
	Dado que eu mande no payload um json sem o campo idLojista
	Quando realizar o cancelamento do pedido pela entrega
	Então devo receber mensagem de violacao

Cenario: Cancelar pedido informando lojista diferente do pedido
	Dado que eu mande no payload um json com o lojista diferente do pedido
	Quando realizar o cancelamento do pedido pela entrega
	Então devo receber mensagem de violacao

Cenario: Cancelar pedido informando idCompraBandeira diferente da Entrega do pedido
	Dado que eu mande no payload um json com o campo idsEntregas diferente do existente do pedido
	Quando realizar o cancelamento do pedido pela entrega
	Então devo receber mensagem de violacao

Cenario: Cancelar um pedido informando no campo origemCancelamento algo diferente de L ou C
	Dado que eu mande no payload um json com o campo origemCancelamento preenxido com um valor diferente do recomendado
	Quando realizar o cancelamento do pedido pela entrega
	Então devo receber mensagem de violacao