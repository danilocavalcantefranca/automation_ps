Quando("informar o id {string} da compra {string}") do |id, order_type|
  @response = @page.(OrderId).get_order id
  @seller_order_id = @response["idCompraBandeira"] 
  @id = id
  @order_type = order_type
end

Quando("informar um id inválido") do
  @response = @page.(OrderId).get_order("sdf")
end

Então("devo visualizar os dados da compra") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["tipoCompra"]).to eq(@order_type)
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @seller_order_id
  expect(@mpcompras.find_anything("compra", query_mongo_purchase)["id"]).to eq(@id) 
end

Então("não devo visualizar dado de compra") do
  expect(@response.code).to eq(400)
  expect(@response.body).to include("Failed to convert value")
end