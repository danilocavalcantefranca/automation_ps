#language: pt

@compra_rest
Funcionalidade: Compra Rest MP-Compras

@compra_rest @sem_campo @normal
Esquema do Cenário: Post compra sem campo
	Dado que envio dados para a API
	Quando informar dados "normal" do post sem o campo "<campo>"
    Então deve retornar o status "400"
	  E devo verificar que a mensagem de erro esta correta
Exemplos: 
	|campo														|
	|idCompraBandeira									|
	|idUnidadeNegocio									|
	|idCanalVenda											|
	|data															|
	|status														|
	|status.id												|
	|status.descricao									|
	|cliente													|
	|cliente.documento								|
	|cliente.email										|
	|cliente.nome											|
	|cliente.sexo											|
	|cliente.sobrenome								|
	|cliente.telefones								|
	|cliente.telefones.tipo					|
	|enderecos												|
	|enderecos.bairro								|
	|enderecos.cep									|
	|enderecos.estado								|
	|enderecos.municipio						|
	|enderecos.numero								|
	|enderecos.pais									|
	|enderecos.rua									|
	|enderecos.tipo									|
	|lojista													|
	|lojista.id												|
	|lojista.nome											|
	|item															|
	|item.idGerencialMarketPlace			|
	|item.idEntrega										|
	|item.tipoInventario							|
	|item.unidadeMedida								|
	|item.quantidade									|
	|item.desconto										|
	|item.precoDe											|
	|item.precoVenda									|
	|item.categorias									|
	|item.categorias.id							|
	|item.categorias.nome						|
	|item.frete												|
	|item.frete.valor									|
	|item.frete.valorCobrado					|
	|item.frete.dataEstimadaEntrega		|
	|item.frete.prazoEstimadoEntrega	|
	|item.sku													|
	|item.sku.id											|
	|item.sku.idLojista								|
	|item.sku.marca										|
	|item.sku.nome										|
	|item.sku.tipo										|
	|formasPagamentos									|
	|formasPagamentos.id						|
	|formasPagamentos.tipo					|
	|formasPagamentos.bandeira			|
	|formasPagamentos.numeroParcelas|

@compra_rest @sem_campo @atacado
Esquema do Cenário: Post compra sem campo no pedido tipo atacado
	Dado que envio dados para a API
	Quando informar dados "atacado" do post sem o campo "<campo>"
    Então deve retornar o status "400"
      E devo verificar que a mensagem de erro esta correta

Exemplos:
	|campo														|
	|idCompraBandeira									|
	|idUnidadeNegocio									|
	|idCanalVenda											|
	|data															|
	|status														|
	|status.id												|
	|status.descricao									|
	|cliente													|
	|cliente.documento								|
	|cliente.email										|
	|cliente.nome											|
	|cliente.sexo											|
	|cliente.telefones								|
	|cliente.telefones.tipo					|
	|enderecos												|
	|enderecos.bairro								|
	|enderecos.cep									|
	|enderecos.estado								|
	|enderecos.municipio						|
	|enderecos.numero								|
	|enderecos.pais									|
	|enderecos.rua									|
	|enderecos.tipo									|
	|lojista													|
	|lojista.id												|
	|lojista.nome											|
	|item															|
	|item.idGerencialMarketPlace			|
	|item.idEntrega										|
	|item.tipoInventario							|
	|item.unidadeMedida								|
	|item.quantidade									|
	|item.desconto										|
	|item.precoDe											|
	|item.precoVenda									|
	|item.categorias									|
	|item.categorias.id							|
	|item.categorias.nome						|
	|item.frete												|
	|item.frete.valor									|
	|item.frete.valorCobrado					|
	|item.frete.dataEstimadaEntrega		|
	|item.frete.prazoEstimadoEntrega	|
	|item.sku													|
	|item.sku.id											|
	|item.sku.idLojista								|
	|item.sku.marca										|
	|item.sku.nome										|
	|item.sku.tipo										|
	|item.taxas.convenioEstados			|
	|item.taxas.icms								|
	|item.taxas.icms.destino				|
	|item.taxas.icms.origem					|
	|item.taxas.iva									|
	|item.taxas.simplesNacional			|
	|item.taxas.st									|
	|formasPagamentos									|
	|formasPagamentos.id						|
	|formasPagamentos.tipo					|
	|formasPagamentos.bandeira			|
	|formasPagamentos.numeroParcelas|

@compra_rest @numero_negativo
Esquema do Cenário: Post compra com número negativo
	Dado que envio dados para a API
	Quando informar valor negativo no campo "<campo>"
    Então deve retornar o status "400"
      E devo verificar que a mensagem de erro esta correta

Exemplos:
	|campo														|
	|idCompraBandeira									|
	|idUnidadeNegocio									|
    |lojista.id												|
	|item.quantidade									|
	|item.desconto										|
	|item.precoDe											|
	|item.precoVenda									|
	|item.categorias.id							|
	|item.frete.valor									|
	|item.frete.valorCobrado					|
	|item.sku.id											|
	|formasPagamentos.id						|

@compra_rest @numero_negativo @atacado
Esquema do Cenário: Post compra com número negativo de taxa
	Dado que envio dados para a API
	Quando informar valor negativo de taxas no campo "<campo>"
    Então deve retornar o status "400"
      E devo verificar que a mensagem de erro esta correta

Exemplos:
	|campo																|
	|item.taxas.simplesNacional					|
	|item.taxas.iva											|
	|item.taxas.st											|
	|item.taxas.convenioEstados					|

@compra_rest @zero
Esquema do Cenário: Post compra com número zero
	Dado que envio dados para a API
	Quando informar valor zero no campo "<campo>"
    Então deve retornar o status "400"
      E devo verificar que a mensagem de erro esta correta

Exemplos:
	|campo															|
	|idCompraBandeira										|
	|idUnidadeNegocio										|
	|lojista.id													|
	|item.quantidade										|
	|item.precoVenda										|
	|item.categorias.id								|
	|item.sku.id												|
	|formasPagamentos.id							|

@compra_rest @pedido
Cenário: Post compra normal
	Dado que envio dados para a API
	Quando informar valor "normal" validos nos campos
    Então deve retornar o status "201"
      E devo verificar que os valores e o id esta sendo apresentado

@compra_rest @pedidoAtacado
Cenário: Post compra atacado
	Dado que envio dados para a API
	Quando informar valor "atacado" validos nos campos
    Então deve retornar o status "201"
      E devo verificar que os valores e o id esta sendo apresentado

@compra_rest @pedidoServico
Cenário: Post compra serviço
	Dado que envio dados para a API
	Quando informar valor "serviço" validos nos campos
    Então deve retornar o status "201"
      E devo verificar que os valores e o id esta sendo apresentado

	