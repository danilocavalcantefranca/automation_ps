Quando("preencher campo idlojista valido") do
  @value = 123
  @response = @page.(DeleteStoreNotification).delete_store_notification(@value)
end

Entao("o lojista deve ser deletado") do
  expect(@response.code).to eq(200)
  url_store_notification = File.read('fixtures/url-store-notification.json')
  expect(@mpcompras.find_id_lojista('notificacaoLojista', @value)["idLojista"]).to eq(JSON.parse(url_store_notification)["idLojista"])
end

Quando("preencher o campo idLojista {int} com caracteres invalidos") do |id_lojista|
  @response = @page.(DeleteStoreNotification).delete_store_notification_invalid(id_lojista)
end

Entao("deve aparecer uma {string} de erro") do |message|
  expect(@response.code).to eq(400)
  expect(@response.parsed_response["message"]).to match(message)
end
