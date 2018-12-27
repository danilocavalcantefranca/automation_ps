Quando("buscar um pedido {string}") do |order|
  @order = order
  ago = Time.now - 1296000 
  @mpcompras.update_order("compra", order, "entregas.0.tracking.2.data", ago)
  date = Time.now - 1296060
  date = date.strftime("%d/%m/%Y %H:%M")
  @response = @page.(OrderPAP).get_default(date)
end

Quando("passar um caracter invalido") do
  @response = @page.(OrderPAP).get_default("kkk")
end

Quando("passar uma data diferente da esperada") do
  @response = @page.(OrderPAP).get_default("08/04/2016 09:00")
end

Então("devo visualizar esse pedido") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response[0]["status"]["id"]).to eq("PAY")
  old_date = Time.parse(@response.parsed_response[0]["entregas"][0]["tracking"][2]["data"]) + 1296000
  actual_date = Time.now
  expect(old_date.to_s.split(":")[0]).to eq(actual_date.to_s.split(":")[0])
end

Então("não deve retornar dados") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response).to be_empty
end

Então("não deve retornar o pedido informado") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response[0]["id"]).to_not eq(@order)
end
