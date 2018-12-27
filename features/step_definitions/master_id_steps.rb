Quando("informar o lojista {string} na api para listar compra por master id") do |seller|
  @response = @page.(MasterId).get_order(seller)
end

Quando("informar o filtro {string} com valor {string} do lojista {string} na api para listar compra por master id") do |filter, value, seller|
  @filter = filter
  @value = value
  @response = @page.(MasterId).get_filter(filter, value, seller)
end

Então("devo visualizar as compras da api para listar compra por master id") do
  expect(@response.code).to eq(200)
  @filter = "documentNumber" if @filter == "documentNr"
  expect(@response.parsed_response["orderList"][0][@filter]).to eq(@value)
end