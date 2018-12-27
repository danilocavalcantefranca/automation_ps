#language: pt

@pedidos_dia
Funcionalidade: Exibir quantidade de pedidos feitos por dia por um lojista

@exibir_qtd_valido
Cenario: Validar endpoint para exibir quantidade de pedidos feitos por dia
  Dado que realizo uma busca na api
  Quando passar o id de um lojista 11077 e a data de inicio "01/01/2018" e fim "01/05/2018"
  Entao deve exibir a quantidade de pedidos feitos no periodo

@exibir_qtd_invalido
Cenario: Validar campo idLojista em branco
  Dado que realizo uma busca na api
  Quando preencher o campo data inicio "01/01/2017" e fim "17/01/2017"
  Entao deve exibir mensagem "Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long';" com status 400

@campo_dt_vazio
Cenario: Validar campos data inicio e data fim em branco
  Dado que realizo uma busca na api
  Quando passar o id de um lojista 11077 e deixar os campos data inicio e data fim em branco
  Entao deve exibir mensagem "Required Date parameter" com status 400