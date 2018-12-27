#language: pt

@id_compra_bandeira
Funcionalidade: Listar Compras por id compra bandeira

@valido
Esquema do Cenário: Exibir dados da compra pelo id compra bandeira
	Dado que realizo uma busca na api
	Quando informar o idCompraBandeira "<id>" do tipo "<tipo>"
	Então devo visualizar os dados daquela compra
Exemplos:
  |id				|tipo   |
  |116655902|NORMAL |
  |122039279|ATACADO|
  |116680611|SERVICO|

@invalido
Cenário: Exibir dados de uma compra inválida
	Dado que realizo uma busca na api
	Quando informar um idCompraBandeira inválido
	Então não devo visualizar dado de compra