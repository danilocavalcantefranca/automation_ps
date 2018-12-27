#language: pt

@compra_id
Funcionalidade: Exibir dados da compra

@valido
Esquema do Cenário: Exibir dados de uma compra
	Dado que realizo uma busca na api
	Quando informar o id "<id>" da compra "<tipo>"
	Então devo visualizar os dados da compra
Exemplos:
  |id         |tipo   |
  |11666309301|NORMAL |
  |11710391602|ATACADO|
  |12155133202|SERVICO|

@invalido
Cenário: Exibir dados de uma compra inválida
	Dado que realizo uma busca na api
	Quando informar um id inválido
	Então não devo visualizar dado de compra