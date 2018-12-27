#language: pt

Funcionalidade: Validar integração com o Front

Cenário: Listar as integrações por lojista
  Dado que realizo uma busca na api
  Quando informar o lojista "11077" para ver as integracoes
  Então devo visualizar as integracoes com o front

Esquema do Cenário: Erro do lojista na integração do front
  Dado que realizo uma busca na api
  Quando informar o lojista "<lojista>" para ver as integracoes
  Então deve exibir mensagem de erro "<mensagem>"
Exemplos: 
  |lojista|mensagem|
  |Erro   |Field error in object 'getAuditoriaIntegracaoFrontParams' on field 'idLojista': rejected value [Erro]|
  |       |Field error in object 'getAuditoriaIntegracaoFrontParams' on field 'idLojista': rejected value [null]|

Cenário: Listar as integrações por pedido
  Dado que realizo uma busca na api
  Quando informar o pedido "260" para ver as integracoes
  Então devo visualizar as integracoes com o front

Cenário: Listar as integrações por data
  Dado que realizo uma busca na api
  Quando informar a data "12/07/2018" para ver as integracoes
  Então devo visualizar as integracoes com o front

Esquema do Cenário: Listar as integrações por status code
  Dado que realizo uma busca na api
  Quando informar o status code "<codigo>" para ver as integracoes
  Então devo visualizar as integracoes com o front
Exemplos:
  |codigo |
  |200    |
  |400    |
  |404    |
  |500    |

Esquema do Cenário: Listar as integrações por erro de integração
  Dado que realizo uma busca na api
  Quando informar o erro de integracao "<erro>" para ver as integracoes
  Então devo visualizar as integracoes com o front com e sem erro de integracao
Exemplos:
  |erro|
  |true |
  |false|