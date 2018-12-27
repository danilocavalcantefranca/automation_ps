Dado("que possua um pedido com status {string}") do |status|
  query_mongo_purchase = QUERIES["search_by_status"]
  query_mongo_purchase["status.id"] = status
  @order = @mpcompras.find_anything("compra", query_mongo_purchase)
end

Quando("realizar o post no endpoint de mensageria passando o parametro {string}") do |status_update|
  @status_update = status_update
  @response = @page.(OrderTrackingDelivered).post_of_tracking_delivered(@order,status_update)
end

Entao("o dado deve estar gravado no banco de dados com status de Entregue") do
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @order["idCompraBandeira"]
  return_mongo = @mpcompras.find_anything("compra",query_mongo_purchase)
  expect(return_mongo["status"]["id"]).to eq(@status_update) 
  puts @order["idCompraBandeira"]
end

Entao("o dado deve estar gravado no banco de dados da mensageria") do
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @order["idCompraBandeira"]
  order = @mpcompras.find_anything("compra", query_mongo_purchase)
  query_mongo_delivered = @mpcompras.find_last_element("statusEntregue")
  expect(query_mongo_delivered[0]["idPedido"]).to eq(order["idCompraBandeira"])
  expect(query_mongo_delivered[0]["ocorrencia"]["status"]).to eq(@status_update) 
end