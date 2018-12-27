class CancellmentDeprecatedItem

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'


  def post_of_cancellment_item(order_id)
    data_hash = JSON.parse(File.read('fixtures/cancellment-deprecated.json'), object_class: OpenStruct)
    data_hash.orderId = order_id["id"]
    data_hash.skuId = order_id["entregas"][0]["itens"][0]["sku"]
    data_hash.quantity = 1
    post(convert_to_hash_recursive(data_hash), self, PATHS["mp-compras"]["cancelamento-item-antigo"])
  end
end