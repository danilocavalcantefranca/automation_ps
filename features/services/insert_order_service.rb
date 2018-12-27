class InsertOrder

  include HTTParty

  base_uri HOSTS["mp-compras"]
  format :json
  headers 'Content-Type' => 'application/json'

  def seek_and_destroy(type, field)
    if type == 'atacado'
      data_hash = JSON.parse(File.read('fixtures/compra-rest-wholesale.json'))
      data_hash['tipoCompra'] = 'ATACADO'
    elsif type == 'serviço'
      data_hash = JSON.parse(File.read('fixtures/compra-rest.json'))
      data_hash['tipoCompra'] = 'SERVICO'
    else
      data_hash = JSON.parse(File.read('fixtures/compra-rest.json'))
    end
    id_number  = Faker::Number.number(10)
    data_hash['item']['frete']['idCompraEntrega'] = id_number
    data_hash['idCompraBandeira'] = id_number
    data_hash = json_change_value_key(field, nil, data_hash, 'delete')
    post(data_hash, self, PATHS["mp-compras"]["compra"])
  end

  def negative_number(field)
    data_hash = JSON.parse(File.read('fixtures/compra-rest.json'))
    id_number  = Faker::Number.number(10)
    data_hash['item']['frete']['idCompraEntrega'] = id_number
    data_hash['idCompraBandeira'] = id_number
    data_hash = json_change_value_key(field, '-1', data_hash, 'change')
    post(data_hash, self, PATHS["mp-compras"]["compra"])
  end

  def negative_number_wholesale(field)
    data_hash = JSON.parse(File.read('fixtures/compra-rest-wholesale.json'))
    id_number  = Faker::Number.number(10)
    data_hash['item']['frete']['idCompraEntrega'] = id_number
    data_hash['idCompraBandeira'] = id_number
    data_hash = json_change_value_key(field, '-1', data_hash, 'change')
    post(data_hash, self, PATHS["mp-compras"]["compra"])
  end

  def field_with_zero(field)
    data_hash = JSON.parse(File.read('fixtures/compra-rest-wholesale.json'))
    id_number  = Faker::Number.number(10)
    data_hash['item']['frete']['idCompraEntrega'] = id_number
    data_hash['idCompraBandeira'] = id_number
    data_hash = json_change_value_key(field, '0', data_hash, 'change')
    post(data_hash, self, PATHS["mp-compras"]["compra"])
  end

  def valid_order(type)
    if type == 'atacado'
      data_hash = JSON.parse(File.read('fixtures/compra-rest-wholesale.json'))
      data_hash['tipoCompra'] = 'ATACADO'
    elsif type == 'serviço'
      data_hash = JSON.parse(File.read('fixtures/compra-rest.json'))
      data_hash['tipoCompra'] = 'SERVICO'
    else
      data_hash = JSON.parse(File.read('fixtures/compra-rest.json'))
    end
    id_number  = Faker::Number.number(10)
    data_hash['item']['frete']['idCompraEntrega'] = id_number
    data_hash['idCompraBandeira'] = id_number
    post(data_hash, self, PATHS["mp-compras"]["compra"])
  end

end