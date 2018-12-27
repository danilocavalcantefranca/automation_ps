#language: pt
 @tracking @um_item @normal
 Funcionalidade: Tracking de item do pedido
  Esquema do Cenário: Atualizar tracking pedido normal com 1 item para EPR ou ENT
 	Dado que eu tenha um payload de pedido normal com um item com "<statuspedido>" para atualizar o tracking para "<statusatualizar>"
 	Quando eu realizar o post do tracking pelo MP-COMPRAS
 	Entao devo visualizar status 200
	E dado gravado no banco de dados com a mensagem de "<mensagem>"
	E dado na collection de auditoriaIntegracaoFront com o tipoIntegracao a 63 
	Exemplos:
	|statuspedido| statusatualizar | mensagem |
	| PAY        | EPR             |Enviado   |
	| SHP        | ENT             |Entregue  |

  @tracking @um_item @normal @erro
 Esquema do Cenário: Atualizar tracking pedido normal com 1 item para EPR ou ENT
 	Dado que eu tenha um payload de pedido normal com um item com "<statuspedido>" para atualizar o tracking para "<statusatualizar>"
  Quando eu realizar o post do tracking pelo MP-COMPRAS
  Entao devo visualizar status 200 
 	E a mensagem "<violacao>"
 Exemplos:
 	|statuspedido|statusatualizar |violacao                         |
 	|CAN   			 | EPR            |A entrega já está cancelada      |
 	|SHP         | WMS            |não pode ser usado por esta loja |
 	|PEN         | EPR            |nao esta paga            				|
	|CAN         | ENT            |A entrega já está cancelada      |
	|DLV         | WMS            |não pode ser usado por esta loja |
  |PEN         | ENT            |nao esta paga            				|


@tracking @um_item @retira
	 Esquema do Cenário: Atualizar tracking pedido retira com 1 item para [WMS,ROT,ARL e ENT]
 	 Dado que eu tenha um payload de pedido retira com um item com "<statuspedido>" para atualizar o tracking para "<statusatualizar>"
 	 Quando eu realizar o post do tracking pelo MP-COMPRAS
 	 Entao devo visualizar status 200
	 E dado gravado no banco de dados com a mensagem de "<mensagem>" para retira
	 Exemplos:
	 |statuspedido| statusatualizar | mensagem                         |
	 | PAP        | WMS             | A Nota Fiscal                    |
	 | WMS        | ROT             | Sua entrega está com nosso       |
	 | ROT        | ARL             | Seu pedido está Disponível       |
	 | ARL        | ENT             | Concluímos a sua entrega         |

@tracking @um_item @retira @erro
Esquema do Cenário: Atualizar tracking pedido retira com 1 item para [WMS,ROT,ARL e ENT]
 	Dado que eu tenha um payload de pedido retira com um item com "<statuspedido>" para atualizar o tracking para "<statusatualizar>"
  Quando eu realizar o post do tracking pelo MP-COMPRAS
  Entao devo visualizar status 200 
 	E a mensagem "<violacao>"
  Exemplos:
 	|statuspedido|statusatualizar |violacao                         |
 	|ARL   			 | WMS            |Já existe WMS                    |
 	|PEI         | WMS            |nao esta paga                    |