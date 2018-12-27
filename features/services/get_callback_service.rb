class GetCallback

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_callback(value, path = PATHS["mp-compras"]["get-callback"])
    self.class.get("#{path}?idLojista=#{value}")
  end
end