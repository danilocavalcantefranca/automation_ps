#language: pt

@post_notificacao_lojista
Funcionalidade: Serviço utilizado para inserir lojistas que podem ser notificados

@notificacaoLojistaDTO
Cenario: Inserir lojista que pode ser notificado
Dado que envio dados para a API
Quando inserir um idlojista valido
Entao devera ser criada a notificacao do lojista 

@notificacaoLojistaDTOInvalido
Esquema do Cenario: Erro ao processar requisicao
Dado que envio dados para a API
Quando inserir um idlojista invalido
Entao devera exibir "<mensagem>" de erro
Exemplos:
|mensagem|
|JSON parse error: Cannot deserialize value of type `java.lang.Long` from String|