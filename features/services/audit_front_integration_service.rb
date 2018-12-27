class AuditFrontIntegration
  
  include HTTParty

  base_uri HOSTS["mp-compras"]
  
  def get_integration(parameters, path = PATHS["mp-compras"]["auditoria-integracao-front"]) 
    self.class.get(path, :query => parameters )
  end

end