class LogStoreIntegration

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_default_integration(store_id, path = PATHS["mp-compras"]["log-integracao-lojista"])
  if store_id.empty?
      self.class.get(path)
  else
    self.class.get("#{path}?idLojista=#{store_id}")
  end
  end
end