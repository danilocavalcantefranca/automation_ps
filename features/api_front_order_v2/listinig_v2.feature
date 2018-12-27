#language: pt

@listinig
Funcionalidade: Listar Compras de multiplos Lojistas

  @obrigatorio_v2
  Cenário: Listar compras com valor obrigatório
    Dado que realizo uma busca na api v2
    Quando informar os lojistas "11077,10138"
    Então devo visualizar as compras

  @falha_obrigatorio_v2
  Esquema do Cenário: Falha de campo obrigatório
    Dado que realizo uma busca na api v2
    Quando informar os lojistas "<lojistas>"
    Então devo visualizar uma mensagem de erro <mensagem>
    Exemplos:
      |lojistas		    |mensagem																			      	|
      |				    |"\"O id do lojista é nulo ou menor que zero.\""	    									|
      |-3,-2			|"\"O id do lojista é nulo ou menor que zero.\""											|
      |sadasdadasd      |"nested exception is java.lang.NumberFormatException: For input string: \"sadasdadasd\"]"  |

  @nulo_obrigatorio_v2
  Cenário: Campo obrigatório nulo
    Dado que realizo uma busca na api v2
    Quando informar os lojistas nulo
    Então devo visualizar uma mensagem de erro

  @filtros_v2
  Esquema do Cenário: Listar compras
    Dado que realizo uma busca na api v2
    Quando informar o filtro "<filtro>" com valor "<valor>" com os lojistas "11077,10138"
    Então devo visualizar as compras de acordo com o filtro
    Exemplos:
      |filtro					|valor					  |
      |freightTime				|3						  |
      |customerName				|Vinicius				  |
      |documentNr				|32799320848			  |
      |orderMasterId			|12412494				  |
      |approvedAt				|2018-06-20T14:57:00Z     |
      |startApprovedDate	    |2018-06-20T14:57:00Z     |
      |finishApprovedDate   	|2018-06-20T14:57:00Z     |
      |minDate					|2018-06-20T14:57:00Z     |
      |startPurchaseDate	    |2018-06-20T14:57:00Z     |
      |finishPurchaseDate   	|2018-06-20T14:57:00Z     |
      |startCanceledDate    	|2018-06-20T14:57:00Z     |
      |finishCanceledDate   	|2018-06-20T14:57:00Z     |
      |startDeliveyDate	        |2018-06-20T14:57:00Z     |
      |finishDeliveryDat    	|2018-06-20T14:57:00Z     |
      |startSentDate			|2018-06-20T14:57:00Z     |
      |finishSentDat			|2018-06-20T14:57:00Z     |
      |status					|APPROVED				  |
      |orderId					|650        			  |
      |startRow					|1						  |
      |direction				|ASC					  |
      |orderOwnerTp				|4						  |