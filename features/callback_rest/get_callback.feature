#language: pt

@retornar_dados_callback
Funcionalidade: Retornar dados de callback do lojista

@retorno_valido
Cenario: Retornar dados de callback do lojista
  Dado que realizo uma busca na api
  Quando buscar lojista através do id
  Entao devo visualizar a url de callback

@retorno_invalido
Esquema do Cenário: Busca passando caracter invalido no campo idLojista
	Dado que realizo uma busca na api
	Quando passar um caracter invalido "ABC" no id do lojista
  Entao devera exibir "<mensagem>" de erro
  Exemplos:
|mensagem|
|Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'|




