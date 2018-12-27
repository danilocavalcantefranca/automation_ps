Dado("que realizo uma busca na api v2") do
  
end

Quando("informar o lojista {string}") do |store|
  @response = @page.(ListOrderV2).get_default(store)
  @store = store
end

Quando("informar o lojista nulo") do
  @response = @page.(ListOrderV2).get_default
end

Quando("informar o filtro {string} com valor {string}") do |filter, value|
  @response = @page.(ListOrderV2).get_filter(filter, value)
end

Então("devo visualizar as compras") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["orderList"]).not_to be_empty
end

Então("devo visualizar uma mensagem de erro") do
  expect(@response.code).to eq(400)
  expect(@response.parsed_response["message"]).to eq("\"O id do lojista é nulo ou menor que zero.\"")
end

Então("devo visualizar uma mensagem de erro {string}") do |message|
  expect(@response.code).to eq(400)
  expect(@response.parsed_response["message"]).to include(message)
end

Então("devo visualizar as compras de acordo com o filtro") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["orderList"]).not_to be_empty
end

Então("devo verificar a mensagem {string} com status code {int}") do |message, code|
  expect(@response.code).to eq(code)
  expect(@response.body).to include(message)
end