#language: pt

@ticket_medio
Funcionalidade: Serviço utilizado para exibir dados de ticket médio de um lojista dentro de um período

@ticket_medio_valido
Cenario: Validar endpoint para exibição de tickets medios
  Dado que realizo uma busca na api
  Quando passar o id de um lojista 11077 e a data inicio "01/01/2018" e fim "03/01/2018"
  Entao deve exibir os tickets medio do periodo

@ticket_medio_invalido
Cenario: Validar campo idlojista em branco
  Dado que realizo uma busca na api
  Quando passar o id de um lojista 0 e a data inicio "01/01/2018" e fim "03/01/2018"
  Entao deve exibir mensagem de erro "\"O id do lojista é nulo ou menor que zero.\""

@ticket_medio_dt_branco
Cenario: Validar campos data inicio em branco
  Dado que realizo uma busca na api
  Quando passar o id de um lojista 11077 e a data inicio "" e fim "03/01/2018"
  Entao deve exibir mensagem de erro "\"O parametro dataInicio está null\""