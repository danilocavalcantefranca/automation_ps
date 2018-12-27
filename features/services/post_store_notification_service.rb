class PostStoreNotification

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'
  
  def post_store_notification(value, path = PATHS["mp-compras"]["post-store-notification"])
    json = File.read('fixtures/url-store-notification.json')
    json_parsed = JSON.parse(json)
    json_parsed["idLojista"] = value
    self.class.post(path, body: json_parsed.to_json)
  end

end