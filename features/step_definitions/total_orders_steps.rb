Quando("informar o id {string} do lojista e uma data valida") do |seller|
  @response = @page.(TotalOrders).get_list_sellers(seller, "valida")
  @responseMongo = @mpcompras.find_order_seller_list("compra", seller)
end

Quando("informar o id do lojista nulo e uma data valida") do
  @response = @page.(TotalOrders).get_list_sellers(nil, "valida")
end

Quando("informar o id {string} do lojista e data invalida") do |seller|
  @response = @page.(TotalOrders).get_list_sellers(seller, "invalida")
end

Quando("informar o id {string} do lojista e data nula") do |seller|
  @response = @page.(TotalOrders).get_list_sellers(seller, "nil")
end

Então("deve me retornar todas as compras do lojista na data informada") do
  expect(@response.code).to eq(200)
  numero_pedidos = @response.parsed_response["totalPedidos"]
  expect(numero_pedidos).to eq(@responseMongo)
end

Então("deve me retornar uma mensagem de falha {string}") do |message|
  expect(@response.parsed_response["message"]).to include(message)
end

Então("deve me retornar uma mensagem de falha no lojista {string}") do |message|
  expect(@response.parsed_response["mensagens"]).to include(message)
end