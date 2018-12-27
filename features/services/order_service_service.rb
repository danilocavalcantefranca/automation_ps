class OrderService

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_default(path = PATHS["mp-compras"]["compra-servico"])
    self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=1&idLojista=29734")
  end

  def get_filter(key, value, path = PATHS["mp-compras"]["compra-servico"])
    self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=2&idLojista=29734&#{key}=#{value}")
  end

  def get_date(date, value, status, path = PATHS["mp-compras"]["compra-servico"])
    self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=1&idLojista=29734&status=#{status}&#{date}=#{value}")
  end

  def get_sequence(value, sequence, path = PATHS["mp-compras"]["compra-servico"])
    self.class.get("#{path}?paginaAtual=0&totalDeElementosPorPagina=2&idLojista=29734&ordernarPor=#{value}&direcao=#{sequence}")
  end

end