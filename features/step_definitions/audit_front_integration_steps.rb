Quando("informar o lojista {string} para ver as integracoes") do |seller|
  @param = seller.to_i
  parameters = {"paginaAtual": 0, "totalDeElementosPorPagina": 1, "idLojista": seller}
  @response = @page.(AuditFrontIntegration).get_integration(parameters)
end

Quando("informar o pedido {string} para ver as integracoes") do |order|
  @param = order.to_i
  parameters = {"paginaAtual": 0, "totalDeElementosPorPagina": 1, "idLojista": 11077, "idPedido": order}
  @response = @page.(AuditFrontIntegration).get_integration(parameters)
end

Quando("informar a data {string} para ver as integracoes") do |date|
  @param = DateTime.parse(date).strftime("%F")
  parameters = {"paginaAtual": 0, "totalDeElementosPorPagina": 1, "idLojista": 11077, "dataEnvio": date}
  @response = @page.(AuditFrontIntegration).get_integration(parameters)
end

Quando("informar o status code {string} para ver as integracoes") do |code|
  @param = code
  parameters = {"paginaAtual": 0, "totalDeElementosPorPagina": 1, "idLojista": 11077, "httpStatus": code}
  @response = @page.(AuditFrontIntegration).get_integration(parameters)
end

Quando("informar o erro de integracao {string} para ver as integracoes") do |error|
  error == "true" ? @param = "erroIntegracao" : @param = "response"
  parameters = {"paginaAtual": 0, "totalDeElementosPorPagina": 1, "idLojista": 11077, "erroIntegracao": error}
  @response = @page.(AuditFrontIntegration).get_integration(parameters)
end

Então("devo visualizar as integracoes com o front") do
  expect(@response.code).to eq(200)
  @response.parsed_response["conteudo"][0]["dataEnvio"] = DateTime.parse(@response.parsed_response["conteudo"][0]["dataEnvio"]).strftime("%F")
  expect(@response.parsed_response["conteudo"][0].values).to include(@param)
end

Então("devo visualizar as integracoes com o front com e sem erro de integracao") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["conteudo"][0]).to include(@param)
end