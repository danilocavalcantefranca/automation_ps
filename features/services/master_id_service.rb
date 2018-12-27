class MasterId

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'

  def get_order(seller, path = PATHS["mp-compras"]["master-id"])
    parameters = {"storeQualifierId" => seller}
    self.class.get(path, :query => parameters)
  end

  def get_filter(filter, value, seller, path = PATHS["mp-compras"]["master-id"])
    self.class.get("#{path}?storeQualifierId=#{seller}&#{filter}=#{value}&pageRows=1")
  end

end