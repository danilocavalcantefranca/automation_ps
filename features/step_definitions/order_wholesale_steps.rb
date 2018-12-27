Quando("informar a quantidade de itens da pagina") do
  @response = @page.(OrderWholesale).get_default
end

Quando("consultar de pedido atacado com o filtro {string} e com valor {string}") do |key, value|
  @response = @page.(OrderWholesale).get_filter(key, value)
end

Quando("consultar a {string} do pedido atacado com valor {string} mais {string}") do |date, value, status|
  @response = @page.(OrderWholesale).get_date(date, value, status)
end

Quando("consultar por {string} e ordem {string} o pedido atacado") do |value, sequence|
  @response = @page.(OrderWholesale).get_sequence(value, sequence)
end