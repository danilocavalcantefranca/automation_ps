Quando("inserir um idlojista valido") do
  @value = 123
  @response = @page.(PostStoreNotification).post_store_notification(@value)
end

Quando("inserir um idlojista invalido") do
  @value = "@&"
  @response = @page.(PostStoreNotification).post_store_notification(@value)
end

Entao("devera ser criada a notificacao do lojista") do
  expect(@response.code).to eq(201)
  expect(@response.body).to be_empty
  url_store_notification = File.read('fixtures/url-store-notification.json')
  expect(@mpcompras.find_idlojista('notificacaoLojista', @value)["idLojista"]).to eq(JSON.parse(url_store_notification)["idLojista"])
end

Entao("devera exibir {string} de erro") do |message|
  expect(@response.code).to eq(400)
  expect(@response.parsed_response['message']).to match(message)
end