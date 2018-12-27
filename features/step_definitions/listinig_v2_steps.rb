
Quando("informar os lojistas {string}") do |stores|
  @response = @page.(Listinig).get_default(stores)
end

Quando("informar os lojistas nulo") do
  @response = @page.(Listinig).get_default(nil)
end

Quando("informar o filtro {string} com valor {string} com os lojistas {string}") do |filter, value, stores|
  @response = @page.(Listinig).get_filter(filter, value, stores)
end
