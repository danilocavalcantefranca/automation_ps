#language: pt

@compras_total @total_orders
Funcionalidade: Verificar a quantidade de compras total do lojista por dia

Cenário: Verificar compras de um lojista
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista e uma data valida
  Então deve me retornar todas as compras do lojista na data informada

Cenário: Verificar mensagem de erro com lojista invalido
  Dado que realizo uma busca na api
  Quando informar o id "teste" do lojista e uma data valida
  Então deve me retornar uma mensagem de falha "Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'"

Cenário: Verificar mensagem de erro com lojista nulo
  Dado que realizo uma busca na api
  Quando informar o id do lojista nulo e uma data valida
  Então deve me retornar uma mensagem de falha no lojista "The request was rejected because the URL was not normalized."

Cenário: Verificar mensagem de erro com data invalida
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista e data invalida
  Então deve me retornar uma mensagem de falha "Failed to convert value of type 'java.lang.String' to required type 'java.util.Date';"

Cenário: Verificar mensagem de erro com data nula
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista e data nula
  Então deve me retornar uma mensagem de falha "O parametro dataInicio está null"
