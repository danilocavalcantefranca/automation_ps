Quando("informo o lojista {string} para buscar mensagens") do |store|
  @response = @page.(AuditMessaging).get_default(store)
end

Quando("informo o lojista {string} e o pedido {int} para buscar mensagens") do |store, order|
  @response = @page.(AuditMessaging).get_order(store, order)
  @order = order
end

Quando("informo o lojista {string} para buscar mensagens {string} {string}") do |store, message, type|
  @message = message
  @type = type
  @response = @page.(AuditMessaging).get_messages(store, @message, @type)
end

Então("devo visualizar todas mensagens enviadas para mensageria") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["conteudo"][0]).not_to be_empty
end

Então("devo visualizar uma mensagem informando o erro") do
  expect(@response.code).to eq(400)
  expect(@response.parsed_response["message"]).to include("Field error in object 'getAuditoriaMensageriaParams' on field 'idLojista': rejected value")
end

Então("devo visualizar as mensagens enviadas para mensageria daquele pedido") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["conteudo"][0]).not_to be_empty
  expect(@response.parsed_response["conteudo"][0]["mensagem"]).not_to be_empty
  expect(@response.parsed_response["conteudo"][0]["idPedido"]).to eq(@order)
end

Então("devo visualizar as mensagens") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["conteudo"][0]).not_to be_empty
  expect(@response.parsed_response["conteudo"][0]["mensagem"]).not_to be_empty
  expect(@response.parsed_response["conteudo"][0][@message].to_s).to eq(@type)
end