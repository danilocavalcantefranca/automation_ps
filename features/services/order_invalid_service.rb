class OrderInvalid

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_default(id = "", path = PATHS["mp-compras"]["compra-invalida"])
    if id.empty?
      self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=1")
    else
      self.class.get("#{path}?paginaAtual=4&totalDeElementosPorPagina=1&idCompraBandeira=#{id}")
    end
  end

end