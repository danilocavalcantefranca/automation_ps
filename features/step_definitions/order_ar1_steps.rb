Dado("que eu possua pedido com status {string} a dois dias") do |status|
  @order = @mpcompras.find_arl("compra")
  @order_updated = @mpcompras.update_date_order("compra", @order["idCompraBandeira"])
end

Dado("que eu possua pedido com status {string} a {int} dias") do |status, day|
  @day = day
  @order = @mpcompras.find_arl("compra")
  @order_updated = @mpcompras.update_date_order("compra", @order["idCompraBandeira"], day)
end

Dado("que eu possua pedido com status {string} com data diferente") do |status|
  @order = @mpcompras.find_arl("compra") 
end

Dado("que eu possua pedido com status {string}") do |status|
  query_status = QUERIES["search_by_status"]
  query_status["status.id"] = status
  @order = @mpcompras.find_anything("compra", query_status)
end

Quando("realizar a requisição do endpoint para atuailizar o pedido ARL") do
  if @day == 2 
    @response = @page.(OrderAr1).get_ar1
  else
    @response = @page.(OrderAr1).get_ar2
  end  
end

Então("devo receber status code {int}") do |code|
  expect(@response.code).to eq(code)
end

Então("meu pedido deve ter sido atualizado para o status {string}") do |status_updated|
  query_status = QUERIES["find_seller_order_id"]
  query_status["idCompraBandeira"] = @order["idCompraBandeira"]
  order = @mpcompras.find_anything("compra",query_status )
  if status_updated == "AR1"
    expect(order["entregas"][0]["tracking"][7]["codigo"]).to eq(status_updated)
  else
    expect(order["entregas"][0]["tracking"][8]["codigo"]).to eq(status_updated)
  end
end

Então("meu pedido não deve ter sido atualizado para o status {string}") do |status_updated|
  query_status = QUERIES["find_seller_order_id"]
  query_status["idCompraBandeira"] = @order["idCompraBandeira"]
  order = @mpcompras.find_anything("compra", query_status)
  if status_updated == "AR1" 
    expect(order["entregas"][0]["tracking"][7]["codigo"]).not_to eq(status_updated)
  else
    expect(order["entregas"][0]["tracking"][8]["codigo"]).not_to eq(status_updated)
  end
end