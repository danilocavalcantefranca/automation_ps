class CancellmentOfDelivered
  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'

  def post_cancellment_delivered(json, path = PATHS["mp-compras"]["cancelamento-entrega"])
  self.class.post(path, body: json.to_json)
  end

  def alter_values(status, sku)
    query_mongo_purchase = QUERIES["find_order_with_sku"]
    query_mongo_purchase["status.id"] = status
    query_mongo_purchase["itens.sku.id"] = sku
    query_mongo_purchase
  end
  def alter_values_delivery(order)
    json = File.read('fixtures/delivered_cancellment.json')
    json_parsed = JSON.parse(json)
    json_parsed["idCompraBandeira"] = order["idCompraBandeira"]
    json_parsed["idLojista"] = order["lojista"]["id"]
    json_parsed["idsEntregas"][0] = order["entregas"][0]["idCompraEntrega"]
    json_parsed
  end
  def alter_values_and_fields(field, order)
    json = File.read('fixtures/delivered_cancellment.json')
    json_parsed = JSON.parse(json)
    json_parsed["idCompraBandeira"] = order["idCompraBandeira"]
    json_parsed["idLojista"] = order["lojista"]["id"]
    if field == "idCompraEntrega"
    json_parsed["idsEntregas"][0] = order["entregas"][0]["idCompraEntrega"]
    else
    json_parsed["idsEntregas"][0] = order["entregas"][0]["idEntrega"] 
  end   
  json_parsed
end

  def alter_values_of_delivery_empty(order)
    json = File.read('fixtures/delivered_cancellment.json')
    json_parsed = JSON.parse(json)
    json_parsed["idCompraBandeira"] = order["idCompraBandeira"]
    json_parsed["idLojista"] = order["lojista"]["id"]
    json_parsed
  end
  def alter_values_origin_cancellment(order,origin_cancellment)
    json = File.read('fixtures/delivered_cancellment.json')
    json_parsed = JSON.parse(json)
    json_parsed["idCompraBandeira"] = order["idCompraBandeira"]
    json_parsed["idLojista"] = order["lojista"]["id"]
    json_parsed["origemCancelamento"] = origin_cancellment
    json_parsed
  end
  def alter_values_two_itens(status, sku, sku_id)
    query_mongo_purchase = QUERIES["find_order_two_items"]
    query_mongo_purchase["status.id"] = status
    query_mongo_purchase["itens.0.sku.id"] = sku
    query_mongo_purchase["itens.1.sku.id"] = sku_id
    query_mongo_purchase
  end
end
