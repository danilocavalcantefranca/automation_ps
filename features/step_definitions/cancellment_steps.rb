Dado("que eu possua um pedido com status {string}") do |status|
  date = DateTime.strptime("#{Time.now - 15778800}", '%Y-%m-%d')
  query_mongo_purchase = QUERIES["find_order_status_cancellment"]
  query_mongo_purchase["data"]["$gte"] = date
  query_mongo_purchase["status.id"] = status
  @order = @mpcompras.find_anything("compra",query_mongo_purchase) 
  puts @order["idCompraBandeira"]
end

Dado("que eu possua um pedido com dois itens com status {string}") do |status|
  date = DateTime.strptime("#{Time.now - 15778800}", '%Y-%m-%d')
  query_mongo_purchase = QUERIES["find_many_items"]
  query_mongo_purchase["data"]["$gte"] = date
  query_mongo_purchase["status.id"] = status
  @order = @mpcompras.find_anything("compra",query_mongo_purchase)
end

Quando("eu realizar o cancelamento do pedido") do
  @cancellment = @page.(Cancellment).get_order_item_to_can(@mpcompras, @order['idCompraBandeira'])
end

Quando("eu realizar o cancelamento do pedido pela api-front") do
  order_id = @order
  @cancellment = @page.(CancellmentDeprecated).post_of_cancellment(order_id)
end

Quando("eu realizar o cancelamento do item do pedido") do
  order_id = @order
  @cancellment = @page.(CancellmentDeprecatedItem).post_of_cancellment_item(order_id)
end

Então("meu pedido deve ser {string}") do |status|
  sleep 1 #erro de timeout
  expect(@cancellment.code).to eq(200)
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @order["idCompraBandeira"]
  order = @mpcompras.find_anything("compra", query_mongo_purchase)
  expect(order["status"]["id"]).to eq(status)
end

Então("meu pedido não deve ser cancelado") do
  sleep 1 #erro de timeout
  puts @order["idCompraBandeira"]
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @order["idCompraBandeira"]
  order = @mpcompras.find_anything("compra", query_mongo_purchase)
  expect(order["status"]["id"]).to eq(@order["status"]["id"])
end