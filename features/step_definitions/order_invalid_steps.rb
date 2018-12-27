Quando("informar a quantidade de pedidos") do
  @response = @page.(OrderInvalid).get_default
end

Quando("informar o idCompraBandeira {string}") do |id|
  @response = @page.(OrderInvalid).get_default(id)
end

Então("devo visualizar o pedido invalido com a mensagem {string}") do |message |
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["conteudo"][0]["mensagemErro"]).to eq(message)
end

Então("devo visualizar a mensagem {string}") do |message|
  expect(@response.code).to eq(400)
  expect(@response.parsed_response["message"]).to eq(message)
end