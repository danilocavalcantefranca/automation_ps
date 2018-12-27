class DeleteStoreNotification

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'
  
  def delete_store_notification(value, path = PATHS["mp-compras"]["apagar-notificacao-lojista"])
    json = File.read('fixtures/url-store-notification.json')
    json_parsed = JSON.parse(json)
    json_parsed["idLojista"] = value
    self.class.delete(path, body: json_parsed.to_json)
  end

  def delete_store_notification_invalid(value, path = PATHS["mp-compras"]["apagar-notificacao-lojista"])
    self.class.delete(path, body: {idLojista: value})
  end 
  
end