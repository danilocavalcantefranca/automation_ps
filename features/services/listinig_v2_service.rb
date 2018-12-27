class Listinig

  include HTTParty
  base_uri HOSTS["mp-compras"]

  def get_default(stores = nil, path = PATHS["mp-compras"]["get-listinig"])
    self.class.get("#{path}?storeQualifierId=#{stores}")
  end

  def get_filter(filter, value, stores, path = PATHS["mp-compras"]["get-listinig"])
    self.class.get("#{path}?storeQualifierId=#{stores}&#{filter}=#{value}")
  end

  def get_date(date, value, status, path = PATHS["mp-compras"]["get-listinig"])
    self.class.get("#{path}?storeQualifierId=11077&#{date}=#{value}&status=#{status}&pageRows=1")
  end

  def get_sequence(value, sequence, path = PATHS["mp-compras"]["get-listinig"])
    self.class.get("#{path}?storeQualifierId=11077&pageRows=1&ordernarPor=#{value}&direction=#{sequence}")
  end

end