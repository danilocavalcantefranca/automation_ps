Quando("passar o id de um lojista {int} e a data de inicio {string} e fim {string}") do |id, initial_date, final_date|
  @response = @page.(OrdersByDay).valid_order(id, initial_date, final_date)
end

Quando("preencher o campo data inicio {string} e fim {string}") do |initial_date, final_date|
  @response = @page.(OrdersByDay).invalid_order(initial_date, final_date)
end

Quando("passar o id de um lojista {int} e deixar os campos data inicio e data fim em branco") do |id|
  @response = @page.(OrdersByDay).empty_field(id)
end

Entao("deve exibir a quantidade de pedidos feitos no periodo") do
  expect(@response.code).to eq(200)
  puts "Existe #{@response.parsed_response["aggregation"].count} pedidos nesse período"
  expect(@response.parsed_response["aggregation"].count).to be > 1
end

Entao("deve exibir mensagem {string} com status {int}") do |message, code|
  expect(@response.code).to eq(code)
  expect(@response.parsed_response["message"]).to include(message)
end