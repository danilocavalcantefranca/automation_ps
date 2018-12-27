class OrderV1

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_seller(store = nil, path = PATHS["mp-compras"]["compra-v1"])
    if store.nil?
      self.class.get("#{path}?pageRows=1")
    else
      self.class.get("#{path}?storeQualifierId=#{store}&pageRows=1")
    end
  end

  def get_filter(filter, value, seller, path = PATHS["mp-compras"]["compra-v1"])
    self.class.get("#{path}?storeQualifierId=#{seller}&#{filter}=#{value}&pageRows=1")
  end

end