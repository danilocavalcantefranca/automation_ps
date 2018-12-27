  Dado("que realizo uma busca na api") do
    @response = @page.(ListOrders).get_default  
  end
  
  Quando("informar a quantidade de itens") do
    @response = @page.(ListOrders).get_default
  end

  Quando("consultar o filtro {string} e com valor {string}") do |key, value|
    @response = @page.(ListOrders).get_filter(key, value)
  end

  Quando("consultar a {string} com valor {string} mais {string}") do |date, value, status|
    @response = @page.(ListOrders).get_date(date, value, status)
  end

  Quando("consultar por {string} e ordem {string}") do |value, sequence|
    @response = @page.(ListOrders).get_sequence(value, sequence)
  end
  
  Então("devo visualizar os pedidos do tipo {string}") do |type|
    schema = JSON.parse(File.read("fixtures/order_schema.json"))
    begin
      JSON::Validator.validate!(schema, @response.parsed_response['conteudo'][0])
    rescue JSON::Schema::ValidationError => e
      puts @response.parsed_response['conteudo'][0]['idCompraBandeira']
      raise e.message 
    end 
    expect(@response.code).to eq(200)
    expect(@response.parsed_response["conteudo"][0]["tipoCompra"]).to eq(type)
  end