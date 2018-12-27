Dado("que a mensageria envie uma requisição para o mp-compras") do
end

Quando("informar os dados do pedido {string} com tipo {string}") do |status, type_payment|
  @status = status
  query_mongo_purchase = QUERIES["search_by_status"]
  query_mongo_purchase["status.id"] = status
  @order = @mpcompras.find_anything('compra', query_mongo_purchase)
  @response = @page.(PurchaseOrder).purchase_order(@order["idCompraBandeira"], type_payment)
end

Então("devo visualizar o status code {int} com registro na api da mensageria") do |code|
  expect(@response.code).to eq(code)
  expect(@response.parsed_response).to eq(nil)
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @order["idCompraBandeira"]
  approved_order = @mpcompras.find_anything('compra', query_mongo_purchase)
  puts approved_order["idCompraBandeira"]
  expect(approved_order["status"]["id"]).to eq("PAY")
  query_mongo_auditing = QUERIES["find_order_id"]
  query_mongo_auditing["idPedido"] = @order["id"]
  audit = @mpcompras.find_anything("auditoriaApiMensageria", query_mongo_auditing)
  expect(audit["statusPedido"]).to eq("PAY")
end

Então("devo visualizar o status code {int} sem registro na api da mensageria") do |code|
  expect(@response.code).to eq(code)
  expect(@response.parsed_response).to eq(nil)
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @order["idCompraBandeira"]
  approved_order = @mpcompras.find_anything('compra', query_mongo_purchase)
  puts approved_order["idCompraBandeira"]
  expect(approved_order["status"]["id"]).to eq(@status)
  query_mongo_auditing = QUERIES["find_order_id"]
  query_mongo_auditing["idPedido"] = @order["id"]
  audit = @mpcompras.find_anything("auditoriaApiMensageria", query_mongo_auditing)
  expect(audit).to eq(nil)
end