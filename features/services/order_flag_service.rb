class OrderFlag
  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_order(id, path = PATHS["mp-compras"]["compra-bandeira"])
    self.class.get(path + id)
  end
end