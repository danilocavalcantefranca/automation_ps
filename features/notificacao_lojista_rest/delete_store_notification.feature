#language: pt

@delete_notificacao_lojista
Funcionalidade: Servico utilizado para deletar notificacao lojista

@delete_valido
Cenario: Validar endpoint de delete de notificacao lojista
  Dado que envio dados para a API
  Quando preencher campo idlojista valido
  Entao o lojista deve ser deletado

@delete_invalido 
Esquema do Cenário: Validar endpoint passando cararteres invalidos no campo idLojista
  Dado que envio dados para a API
  Quando preencher o campo idLojista 0000 com caracteres invalidos
  Entao deve aparecer uma "<mensagem>" de erro
Exemplos:
    |mensagem|
    |JSON parse error | 