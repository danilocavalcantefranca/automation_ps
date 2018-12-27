class OrderTracking

    include HTTParty

    base_uri HOSTS["mp-compras"]
    format :json
    headers 'Content-Type' => 'application/json'

    def post_of_return_mongo_status(retorno_json_pedido,status_atualizar)
      data_hash = JSON.parse(File.read('fixtures/order_tracking.json'), object_class: OpenStruct)
      data_hash.trackings.map{|order| order.orderId = retorno_json_pedido["id"]}
      data_hash.trackings.map{|order| order.orderItemId = retorno_json_pedido["itens"][0]["sku"]["id"].to_s + '-1'}
      data_hash.trackings.map{|order| order.occurenceDt = Time.now.strftime('%Y-%m-%dT%H:%M:00.414Z')}
      data_hash.trackings.map{|order| order.controlPoint = status_atualizar}
      retorno_status = retorno_json_pedido["status"]["id"]
      data_hash.trackings.map{|store_qualifier_id| store_qualifier_id.storeQualifierId = retorno_json_pedido["lojista"]["id"]}
      post_order(convert_to_hash_recursive(data_hash)) 
    end

    def post_order(data_hash, path = PATHS["mp-compras"]["tracking"])
      data_hash = JSON.parse(data_hash.to_json)
      id_lojista = data_hash["trackings"][0]["storeQualifierId"]
      self.class.post("#{path}?storeQualifierId=#{id_lojista}", body: data_hash.to_json)
  end
end