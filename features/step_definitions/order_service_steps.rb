Quando("realizar uma busca de pedido de servico") do
  @response = @page.(OrderService).get_default
end

Quando("consultar de pedido servico com o filtro {string} e com valor {string}") do |key, value|
  @response = @page.(OrderService).get_filter(key, value)
end

Quando("consultar a {string} do pedido servico com valor {string} mais {string}") do |date, value, status|
  @response = @page.(OrderService).get_date(date, value, status)
end

Quando("consultar por {string} e ordem {string} o pedido servico") do |value, sequence|
  @response = @page.(OrderService).get_sequence(value, sequence)
end