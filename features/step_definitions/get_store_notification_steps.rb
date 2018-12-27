Quando("buscar lojista preenchendo o campo pagina atual {int}") do |value|
  @response = @page.(GetStoreNotification).get_store_notification_page(value)
end

Quando("passar um id valido do lojista") do
  @response = @page.(GetStoreNotification).get_store_notification_id
end

Quando("passar um caracter invalido no campo idlojista") do
  @response = @page.(GetStoreNotification).get_store_notification_invalid
end

Entao("devo visualizar a lista com os lojistas") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["conteudo"][0]["idLojista"].to_s).not_to be_empty
end


