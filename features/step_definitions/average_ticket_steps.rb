Quando("passar o id de um lojista {int} e a data inicio {string} e fim {string}") do |id, initial_date, final_date|
  @response = @page.(AverageTicket).average_ticket_valid(id, initial_date, final_date)
end

Entao("deve exibir os tickets medio do periodo") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response[0]).to include("ticketAverage")
end

Entao("deve exibir mensagem de erro {string}") do |error_message|
  expect(@response.code).to eq(400)
  expect(@response.parsed_response["message"]).to include(error_message)
end