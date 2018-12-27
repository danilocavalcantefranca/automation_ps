Dado("que eu tenha um payload de pedido normal com um item com {string} para atualizar o tracking para {string}") do |status_order, status_update|
    query_mongo_purchase = QUERIES["find_order_with_status"]
    query_mongo_purchase["status.id"] = status_order
    @return_json_order = @mpcompras.find_anything('compra',query_mongo_purchase)
    expect(@return_json_order).not_to be_empty, "Não existe pedido para realizar o cenário"
    @status_update = status_update
end

Dado("que eu tenha um payload de pedido retira com um item com {string} para atualizar o tracking para {string}") do |status_order, status_update|
    if status_order == "PAY" && !status_update == "WMS"
      query_mongo_purchase = query_mongo_purchase 
      query_mongo_purchase["status.id"] = status_order
      @return_json_order = @mpcompras.find_anything('compra',query_mongo_purchase)    
    else
       @return_json_order = @mpcompras.find_order_with_status_retira('compra',status_order)
    end
    expect(@return_json_order).not_to be_empty, "Não existe pedido para realizar o cenário"
    @status_update = status_update
end

Quando("eu realizar o post do tracking pelo MP-COMPRAS") do
    @response = @page.(OrderTracking).post_of_return_mongo_status(@return_json_order,@status_update)
end

Entao("devo visualizar status 200") do
    expect(@response.code).to eq(200)
end

Entao("dado gravado no banco de dados com a mensagem de {string}") do |message|
    query_mongo_purchase = QUERIES["find_seller_order_id"]
    query_mongo_purchase["idCompraBandeira"] = @return_json_order["idCompraBandeira"]
    order_number = @mpcompras.find_anything("compra", query_mongo_purchase)
    expect(order_number["status"]["descricao"]).to match(message)
end

Entao("dado gravado no banco de dados com a mensagem de {string} para retira") do |message|
    query_mongo_purchase = QUERIES["find_seller_order_id"]
    query_mongo_purchase["idCompraBandeira"] = @return_json_order["idCompraBandeira"]
    order_number = @mpcompras.find_anything("compra", query_mongo_purchase)
    expect(order_number["entregas"][0]["tracking"].last["mensagem"]).to match(message)
end
  
Entao("a mensagem {string}") do |violation|
    expect(@response.parsed_response["trackingErrorLOS"][0]["errorMessage"]).to match(violation)
end

Entao("dado na collection de auditoriaIntegracaoFront com o tipoIntegracao a {int}") do |id_integration|    query_mongo_auditing = QUERIES["find_order_id"]
    query_mongo_auditing["idPedido"] = @return_json_order["id"]
    auditing = @mpcompras.find_anything("auditoriaIntegracaoFront", query_mongo_auditing)
    expect(auditing[0]["tipoIntegracao"]).to eq(id_integration)
end