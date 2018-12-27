Quando("buscar lojista através do id") do
  @response = @page.(GetCallback).get_callback("11077")
end

Quando("passar um caracter invalido {string} no id do lojista") do |invalid|
  @invalid = invalid
  @response = @page.(GetCallback).get_callback(@invalid)
end

Entao("devo visualizar a url de callback") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["urlCallBack"]).not_to be_empty
  puts @response.parsed_response["urlCallBack"]
end