class PurchaseOrder

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'

  def purchase_order(order_id, type_payment)
    json = File.read("fixtures/purchase-order.json")
    json_parsed = JSON.parse(json)
    content = JSON.parse(json_parsed["Message"]["Content"])
    content["idCompraBandeira"] = order_id
    content["formasPagamentos"][0]["tipo"] = type_payment
    json_parsed["Message"]["Content"] = content.to_json
    post(json_parsed, self, PATHS["mp-compras"]["aprovacao-pedido"])
  end

end