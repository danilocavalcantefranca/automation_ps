class OrderId

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_order(id, path = PATHS["mp-compras"]["compra-id"])
    self.class.get(path + id)
  end
end