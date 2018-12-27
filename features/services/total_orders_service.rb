class TotalOrders

  include HTTParty
  base_uri HOSTS["mp-compras"]

  def get_list_sellers(seller, type)
    if type == "valida"
      date = Time.now
      date = date.strftime("%d/%m/%Y")
    elsif type == "invalida"
      date = "teste"
    else
      date = nil
    end
    get(seller, date)
  end

  def get(seller, date, path = PATHS["mp-compras"]["ranking"])
    self.class.get("#{path}/#{seller}/comprastotal?data=#{date}&paginaAtual=1&totalDeElementosPorPagina=5")
  end
end