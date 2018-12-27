#language: pt

@tracking 
Funcionalidade: Atualizar tracking via mensageria para entregue

@entregue @sucesso 
Esquema do Cenário: Atualizar tracking via mensageria
  Dado que possua um pedido com status "<status>" 
  Quando realizar o post no endpoint de mensageria passando o parametro "<status_atualizar>"
  Entao o dado deve estar gravado no banco de dados com status de Entregue
  Exemplos:
  |status|status_atualizar |
  |SHP   |DVL              |

@entregue @erro
Esquema do Cenário: Atualizar tracking via mensageria 
  Dado que eu possua um pedido com status "<status>"
  Quando realizar o post no endpoint de mensageria passando o parametro "<status_atualizar>"
  Entao o dado deve estar gravado no banco de dados da mensageria
  Exemplos:
  |status|status_atualizar |
  |PAY   |ETR              |
  |ENT   |PAP              |
  |WMS   |CAN              |
  |CAN   |PAY              |