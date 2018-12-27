class OrderTrackingDelivered

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'

  def post_of_tracking_delivered(order,status_update)
    json = File.read('fixtures/order_tracking_delivered.json')
    json_parsed = JSON.parse(json)
    content = JSON.parse(json_parsed["Message"]["Content"])
    content["idPedido"] = order["idCompraBandeira"]
    content["ocorrencia"]["status"] = status_update
    content["idLojista"] = order["lojista"]["id"]
    content["idPedidoExterno"] = order["entregas"][0]["idCompraEntrega"]
    json_parsed["Message"]["Content"] = content.to_json
    post(json_parsed, self, PATHS["mp-compras"]["tracking-entregue"])
  end
end
