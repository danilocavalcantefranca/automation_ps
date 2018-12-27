#language: pt

@notificacao_lojista
Funcionalidade: Serviço utilizado para listar lojista que pode ser notificado

@notificacao_pagina_atual
Cenario: Listar lojistas que podem ser notificados
  Dado que realizo uma busca na api
  Quando buscar lojista preenchendo o campo pagina atual 0
  Entao devo visualizar a lista com os lojistas

@notificacao_id_lojista
Cenario: Listar lojistas preenchendo o campo idLojista
  Dado que realizo uma busca na api
  Quando passar um id valido do lojista
  Entao devo visualizar a lista com os lojistas

@notificacao_id_lojista_invalido
Cenario: Busca passando caracter invalido no campo idLojista
	Dado que realizo uma busca na api
	Quando passar um caracter invalido no campo idlojista 
	Então devo verificar a mensagem de erro do caracter invalido

@notificacao_pagina_atual_invalido
Cenario: Busca passando caracter invalido no campo paginaAtual
  Dado que realizo uma busca na api
	Quando passar um caracter invalido no campo idlojista 
	Então devo verificar a mensagem de erro do caracter invalido