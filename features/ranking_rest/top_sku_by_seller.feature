#language: pt

@top_sku
Funcionalidade: Verificar os skus mais vendidos do lojista

Cenário: Verificar os 5 top skus do lojista
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista
  Então deve me retornar os 5 skus mais vendidos

Esquema do Cenário: Verificar os 5 top skus do lojista por data
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista com o campo "<field>" com valor "<date>"
  Então deve me retornar os 5 skus mais vendidos a partir da data informada
Exemplos:
  |field      |date       |
  |dataInicial|01/01/2018 |
  |dataFinal  |01/06/2018 |

Cenário: Verificar os top skus do lojista por limite
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista com limite de "7"
  Então deve me retornar a quantidade informada de sku mais vendidos

Esquema do Cenário: Verificar os top skus do lojista com ordenacao
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista com a ordenacao "<ordenacao>"
  Então deve me retornar os skus com ordenacao correta
Exemplos:
  |ordenacao|
  |DESC     |
  |ASC      |

Cenário: Verificar mensagem com lojista invalido
  Dado que realizo uma busca na api
  Quando informar o id "stringErro" do lojista 
  Então deve me retornar uma mensagem de falha "Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'"

Cenário: Verificar mensagem com lojista nulo
  Dado que realizo uma busca na api
  Quando não informar id do lojista
  Então deve me retornar uma mensagem de falha "Required Long parameter 'idLojista' is not present"

Esquema do Cenário: Verificar mensagem com data invalida
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista com o campo "<field>" com valor "<date>"
  Então deve me retornar uma mensagem de falha "<message>"
Exemplos:
  |field      |date     |message                                                                              |
  |dataInicial|stringErro|Failed to convert value of type 'java.lang.String' to required type 'java.util.Date';|
  |dataFinal  |stringErro|Failed to convert value of type 'java.lang.String' to required type 'java.util.Date';|

Cenário: Verificar mensagem com limite invalido
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista com limite de "stringErro"
  Então deve me retornar uma mensagem de falha "Failed to convert value of type 'java.lang.String' to required type 'int'"

Cenário: Verificar mensagem com ordenacao invalida
  Dado que realizo uma busca na api
  Quando informar o id "11077" do lojista com a ordenacao "stringErro"
  Então deve me retornar os skus com ordenacao default