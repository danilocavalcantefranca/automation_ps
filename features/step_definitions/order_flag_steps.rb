Quando("informar o idCompraBandeira {string} do tipo {string}") do |id_compra_bandeira, type|
  @response = @page.(OrderFlag).get_order(id_compra_bandeira)
end

Quando("informar um idCompraBandeira inválido") do
  @response = @page.(OrderFlag).get_order("sdf")
end

Então("devo visualizar os dados daquela compra") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response).not_to be_empty
end