class OrderAr1

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_ar1(path = PATHS["mp-compras"]['status-ar1'])
    self.class.get(path)
  end
  
  def get_ar2(path = PATHS["mp-compras"]['status-ar2'])
    self.class.get(path)
  end

end