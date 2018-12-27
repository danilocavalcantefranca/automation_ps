#language: pt

@inserir_dados
Funcionalidade: Atualização de URL callback para o lojista

@atualizar_lojista_valido
Cenario: Atualizar URL callback para o lojista
  Dado que envio dados para a API
  Quando preencher o campo idlojista com lojista valido
  Entao a URL callback do lojista deverá ser atualizada