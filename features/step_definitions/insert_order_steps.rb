Dado("que envio dados para a API") do
end

Quando("informar dados {string} do post sem o campo {string}") do |type, field|
  @response = @page.(InsertOrder).seek_and_destroy(type, field)
end

Quando("informar valor negativo no campo {string}") do |field|
  @response = @page.(InsertOrder).negative_number(field)
end

Quando("informar valor negativo de taxas no campo {string}") do |field|
  @response = @page.(InsertOrder).negative_number_wholesale(field)
end

Quando("informar valor zero no campo {string}") do |field|
  @response = @page.(InsertOrder).field_with_zero(field)
end

Quando("informar valor {string} validos nos campos") do |type|
  @response = @page.(InsertOrder).valid_order(type)
end

Então("deve retornar o status {string}") do |status|
  expect(@response.code).to eq(status.to_i), "Retornou o Status #{@response.code}, e deveria retornar o Status #{status}."
  expect(@response.body).not_to be_empty, "O Body nao deveria ter vindo vazio."
end

Então("devo verificar que os valores e o id esta sendo apresentado") do
  body_parsed = JSON.parse(@response.body)
  value = body_parsed["valor"]
  freight_value = body_parsed["valorFrete"]
  total_value = body_parsed["valorTotal"]
  expect(body_parsed["id"]).to be > 1, "O Id do order nao foi apresentado corretamente: #{body_parsed["id"]}."
  expect(value + freight_value).to eq(total_value), "Valor do Pedido deveria ser R$#{value + freight_value},\nporem foi apresentado R$#{total_value}."
end

Então("devo verificar que a mensagem de erro esta correta") do
  json = @mpcompras.find_last_element("compraInvalida")
  body_parsed = JSON.parse(@response.body)
  expect(@mpcompras.verify_body_exists("compraInvalida", json[0][:_id])).not_to be_empty, "O retorno nao deveria estar vazio."
  expect(json[0][:mensagemErro]).to include(body_parsed["message"])
end