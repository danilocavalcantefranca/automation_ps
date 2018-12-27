Quando("informar o lojista {string} na api antiga") do |seller|
  @seller = seller
  @response = @page.(OrderV1).get_seller(seller)
end

Quando("informar o lojista nulo na api antiga") do
  @response = @page.(OrderV1).get_seller
end

Então("devo visualizar as compras da api antiga") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["orderList"][0]["trackings"][0]["storeQualifierId"]).to eq(@seller)
end

Então("devo visualizar uma mensagem de erro {string} da api antiga") do |message|
  expect(@response.code).to eq(400)
  expect(@response.parsed_response["message"]).to include(message)
end

Quando("informar o filtro {string} com valor {string} do lojista {string} na api antiga") do |filter, value, seller|
  @seller = seller
  @response = @page.(OrderV1).get_filter(filter, value, seller)
end

Então("devo verificar a mensagem {string} com status code {int} na api antiga") do |message, code|
  expect(@response.code).to eq(code)
  expect(@response.parsed_response["message"]).to include(message)
end

Então("devo verificar a mensagem de retorno com status code {int} na api antiga") do |code|
  expect(@response.code).to eq(code)
  expect(@response.parsed_response["message"]).to eq("ok")
end