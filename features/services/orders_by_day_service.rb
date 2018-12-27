class OrdersByDay

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def valid_order(id, initial_date, final_date, path = PATHS["mp-compras"]["pedidos-por-dia"])
    self.class.get("#{path}/#{id}/pedidosPorDia/?dataInicio=#{initial_date}&dataFim=#{final_date}")
  end
  
  def invalid_order(initial_date, final_date, path = PATHS["mp-compras"]["pedidos-por-dia"])
    self.class.get("#{path}/pedidosPorDia/?dataInicio=#{initial_date}&dataFim=#{final_date}")
  end
  
  def empty_field(id, path = PATHS["mp-compras"]["pedidos-por-dia"] )
    self.class.get("#{path}/#{id}/pedidosPorDia")
  end
  
end