#language: pt

@listar_log_lojista
Funcionalidade: Listar todos logs de integração com o lojista 

@log_lojista
Esquema do Cenário: Listar logs do lojista
  Dado que realizo uma busca na api de integracao com o lojista "<idlojista>"
  Quando buscar os logs de integracao
  Então deve me exibir os logs de integração do lojista
  Exemplos:
  |idlojista|
  |11077    |
  |         |
  |12785|

@log_lojista @erro
Esquema do Cenário: Listar logs do lojista com lojistas invalidos
  Dado que realizo uma busca na api de integracao com o lojista "<idlojista>"
  Quando buscar os logs de integracao
  Então não deve me exibir os logs de integração do lojista
  Exemplos:
  |idlojista|
  |99999    |

@log_lojista
Esquema do Cenário: Listar logs do lojista com erro
  Dado que realizo uma busca na api de integracao com o lojista "<idlojista>"
  Quando buscar os logs de integracao
  Então devera exibir "<mensagem>" de erro
  Exemplos:
  |idlojista| mensagem                                                          |
  |asd      | org.springframework.validation.BeanPropertyBindingResult: 1 errors|
  |@@       | org.springframework.validation.BeanPropertyBindingResult: 1 errors|