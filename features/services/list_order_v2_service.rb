class ListOrderV2

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_default(store = nil, path = PATHS["mp-compras"]["compra-v2"])
    if store.nil?
      self.class.get("#{path}?pageRows=1")
    else
      self.class.get("#{path}?storeQualifierId=#{store}&pageRows=1")
    end
  end

  def get_filter(filter, value, path = PATHS["mp-compras"]["compra-v2"])
    self.class.get("#{path}?storeQualifierId=11077&#{filter}=#{value}&pageRows=1")
  end

  def get_date(date, value, status, path = PATHS["mp-compras"]["compra-v2"])
    self.class.get("#{path}?storeQualifierId=11077&#{date}=#{value}&status=#{status}&pageRows=1")
  end

  def get_sequence(value, sequence, path = PATHS["mp-compras"]["compra-v2"])
    self.class.get("#{path}?storeQualifierId=11077&pageRows=1&ordernarPor=#{value}&direction=#{sequence}")
  end

end