Dado("que realizo uma busca na api de integracao com o lojista {string}") do |store_id|
  @response = @page.(LogStoreIntegration).get_default_integration(store_id)
  @store_id = store_id
end

Quando("buscar os logs de integracao") do
  @response = @page.(LogStoreIntegration).get_default_integration(@store_id)
end

Então("deve me exibir os logs de integração do lojista") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["conteudo"][0]["envio"]).not_to eq nil
end

Então("não deve me exibir os logs de integração do lojista") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["totalDeElementos"]).to eq(0)
end