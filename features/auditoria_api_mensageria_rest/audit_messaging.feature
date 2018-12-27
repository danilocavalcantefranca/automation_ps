#language: pt

@listar_mensagem_enviada
Funcionalidade: Listar as mensagens enviadas para a mensageria

@sem_filtro
Cenário: Listar mensagens enviadas para a mensageria sem filtros
  Dado que realizo uma busca na api
  Quando informo o lojista "11077" para buscar mensagens
  Então devo visualizar todas mensagens enviadas para mensageria

@sem_lojista
Cenário: Não informar idLojista
  Dado que realizo uma busca na api
  Quando informo o lojista "" para buscar mensagens
  Então devo visualizar uma mensagem informando o erro

@pedido
Cenário: Listar mensagens enviadas para a mensageria de um pedido
  Dado que realizo uma busca na api
  Quando informo o lojista "11077" e o pedido 11201077301 para buscar mensagens
  Então devo visualizar as mensagens enviadas para mensageria daquele pedido

@mensagens
Esquema do Cenário: Listar mensagens enviadas para a mensageria que foram processadas
  Dado que realizo uma busca na api
  Quando informo o lojista "<lojista>" para buscar mensagens "<mensagem>" "<tipo>"
  Então devo visualizar as mensagens
Exemplos:
  |lojista|mensagem           |tipo |
  |11077  |mensagemProcessada |true |
  |13244  |mensagemProcessada |false|
  |12785  |mensagemPerdida    |true |
  |11077  |mensagemPerdida    |false|
  |14694  |erroEnvioMensageria|true |
  |14694  |erroEnvioMensageria|false|