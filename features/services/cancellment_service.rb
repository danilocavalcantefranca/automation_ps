class Cancellment

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'

  def get_order_item_to_can(mpcompras, order_id)
    json = File.read("fixtures/cancellment.json")
    json_parsed = JSON.parse(json)
    query_mongo_purchase = QUERIES["find_seller_order_id"]
    query_mongo_purchase["idCompraBandeira"] = order_id
    order = mpcompras.find_anything("compra",query_mongo_purchase)
    content = JSON.parse(json_parsed["Message"]["Content"])
    content["idCompraBandeira"] = order_id
    json_parsed["Message"]["Content"] = content.to_json
    post(json_parsed, self, PATHS["mp-compras"]["cancelamento"])
  end

end