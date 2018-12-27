class GetStoreNotification

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_store_notification_page(value, path = PATHS["mp-compras"]["get-notificacao-lojista"])
    self.class.get("#{path}?paginaAtual=#{value}")
  end

  def get_store_notification_id(path = PATHS["mp-compras"]["get-notificacao-lojista"])
    self.class.get("#{path}?idLojista=11077")
  end
  
  def get_store_notification_invalid(path = PATHS["mp-compras"]["get-notificacao-lojista"])
    self.class.get("#{path}?idLojista=ABC")
  end
end
