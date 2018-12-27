class AverageTicket

  include HTTParty

  base_uri HOSTS["mp-compras"]

  def average_ticket_valid(id, initial_date, final_date, path = PATHS["mp-compras"]["ticket-medio"])
    self.class.get("#{path}/#{id}/ticketmedio?dataInicio=#{initial_date}&dataFim=#{final_date}")
  end

end
