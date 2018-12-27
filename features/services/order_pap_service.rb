class OrderPAP

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_default(value, path = PATHS["mp-compras"]["compra-pap"])
    self.class.get("#{path}?data=#{value}")
  end

end