class TopSkuBySeller

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def get_top_skus(seller = nil, limit = 5 , ordination = "DESC", path = PATHS["mp-compras"]["top-sku-by-seller"])
    if seller == nil
      self.class.get("#{path}?limit=#{limit}&paginaAtual=1&totalDeElementosPorPagina=#{limit}&ordenacao=#{ordination}")
    else
      self.class.get("#{path}?idLojista=#{seller}&limit=#{limit}&paginaAtual=1&totalDeElementosPorPagina=#{limit}&ordenacao=#{ordination}")
    end
  end
  
  def get_top_skus_by_initial_date(seller, field, date, path = PATHS["mp-compras"]["top-sku-by-seller"])
    self.class.get("#{path}?idLojista=#{seller}&#{field}=#{date}&limit=5&paginaAtual=1&totalDeElementosPorPagina=5&ordenacao=DESC")
  end

end