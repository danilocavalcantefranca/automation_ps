Dado("que eu possua um pedido com status {string} com o sku {int}") do |status, id_sku|
  @sku = id_sku
  query_mongo_purchase = @page.(CancellmentOfDelivered).alter_values(status,id_sku)
  @order = @mpcompras.find_anything("compra",query_mongo_purchase)
end

Dado("que eu possua um pedido com dois itens diferentes na mesma entrega com o status {string} e skus {int} e {int}") do |status, sku, sku_id|
  @sku = sku
  @sku_id = sku_id 
  query_mongo_purchase = @page.(CancellmentOfDelivered).alter_values_two_itens(status, sku, sku_id)
  @order = @mpcompras.find_anything("compra",query_mongo_purchase)
end


Dado("que eu mande no payload um json com o campo {string} com status {string} e sku {int}") do |field, status, id_sku|
  @sku = id_sku
  @field = field
  query_mongo_purchase = @page.(CancellmentOfDelivered).alter_values(status,id_sku)
  @order = @mpcompras.find_anything("compra",query_mongo_purchase)
end


Dado("consulte o estoque dos produtos") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @old_total_quantity_sku = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  @old_total_quantity_sku_id = @page.(Oracle).find_stock_sku(query_total_quantity,@sku_id)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @old_purchase_quantity_sku = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  @old_purchase_quantity_sku_id = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku_id)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @old_available_quantity_sku = @page.(Oracle).find_stock_sku(query_available_quantity,@sku) 
  @old_available_quantity_sku_id = @page.(Oracle).find_stock_sku(query_available_quantity,@sku_id) 
end

Dado("consulte o estoque do produto") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @old_total_quantity = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @old_purchase_quantity = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @old_available_quantity = @page.(Oracle).find_stock_sku(query_available_quantity,@sku)
end

Dado("que eu mande no payload um json com o campo origemCancelamento preenxido com o valor {string} e pedido no status {string}") do |origin_cancel, status|
  @origin_cancel = origin_cancel
  query_mongo_purchase = QUERIES["search_by_status"]
  query_mongo_purchase["status.id"] = status
  @order = @mpcompras.find_anything("compra",query_mongo_purchase)
end

Dado("que eu possua um pedido com dois itens do mesmo SKU na mesma entrega com o status {string} e sku {int}") do |status, id_sku|
  @sku = id_sku 
  query_mongo_purchase = @page.(CancellmentOfDelivered).alter_values(status,id_sku)
  @order = @mpcompras.find_anything("compra",query_mongo_purchase)
end

Quando("realizar o cancelamento informando um dos campos") do
  json_parsed = @page.(CancellmentOfDelivered).alter_values_and_fields(@field,@order)
  @response = @page.(CancellmentOfDelivered).post_cancellment_delivered(json_parsed)
end

Quando("realizar o cancelamento do pedido pela entrega") do
  json_parsed = @page.(CancellmentOfDelivered).alter_values_delivery(@order)
  @response = @page.(CancellmentOfDelivered).post_cancellment_delivered(json_parsed)
end
Quando("realizar o cancelamento do pedido pela entrega sem passar a entrega") do
  json_parsed = @page.(CancellmentOfDelivered).alter_values_of_delivery_empty(@order)
  @response = @page.(CancellmentOfDelivered).post_cancellment_delivered(json_parsed)
end

Quando("realizar o cancelamento do pedido pela entrega passando a origem do cancelamento") do
  json_parsed = @page.(CancellmentOfDelivered).alter_values_origin_cancellment(@order,@origin_cancel)
  @response = @page.(CancellmentOfDelivered).post_cancellment_delivered(json_parsed)
end

Então("meu pedido deve estar com status {string}") do |status|
  expect(@response.code).to eq(200)
  query_mongo_purchase = QUERIES["find_seller_order_id"]
  query_mongo_purchase["idCompraBandeira"] = @order["idCompraBandeira"]
  order = @mpcompras.find_anything("compra", query_mongo_purchase)
  expect(order["status"]["id"]).to eq(status)
end


Então("estoque alterado conforme regra do status PEN") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @new_total_quantity = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @new_purchase_quantity = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @new_available_quantity = @page.(Oracle).find_stock_sku(query_available_quantity,@sku)
  expect(@new_total_quantity[0][0]).to eq(@old_total_quantity[0][0])
  expect(@new_purchase_quantity[0][0]).to be < (@old_purchase_quantity[0][0])
  expect(@new_available_quantity[0][0]).to be > (@old_available_quantity[0][0])
end

Então("estoque alterado conforme regra do status PAY") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @new_total_quantity = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @new_purchase_quantity = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @new_available_quantity = @page.(Oracle).find_stock_sku(query_available_quantity,@sku)
  expect(@new_total_quantity[0][0]).to be < (@old_total_quantity[0][0])
  expect(@new_purchase_quantity[0][0]).to be < (@old_purchase_quantity[0][0])
  expect(@new_available_quantity[0][0]).to eq (@old_available_quantity[0][0])
end

Então("estoque alterado conforme regra do status PEN baixando o estoque referente aos dois itens") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @new_total_quantity = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @new_purchase_quantity = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @new_available_quantity = @page.(Oracle).find_stock_sku(query_available_quantity,@sku)
  validate_purchase = @old_purchase_quantity[0][0] - @new_purchase_quantity[0][0]
  validate_available = @new_available_quantity [0][0] - @old_available_quantity[0][0]
  validate_total = @old_total_quantity[0][0] - @new_total_quantity[0][0]
  expect(validate_purchase).to eq(2)
  expect(validate_available).to eq(2)
  expect(validate_total).to eq(0)
end

Então("estoque alterado conforme regra do status PAY baixando o estoque referente aos dois itens") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @new_total_quantity = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @new_purchase_quantity = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @new_available_quantity = @page.(Oracle).find_stock_sku(query_available_quantity,@sku)
  validate_purchase = @old_purchase_quantity[0][0] - @new_purchase_quantity[0][0]
  validate_available = @new_available_quantity [0][0] - @old_available_quantity[0][0]
  validate_total = @old_total_quantity[0][0] - @new_total_quantity[0][0]
  expect(validate_purchase).to eq(2)
  expect(validate_available).to eq(0)
  expect(validate_total).to eq(2)
end


Então("estoque alterado conforme regra do status PEN baixando o estoque referente aos dois itens diferentes") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @new_total_quantity_sku = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  @new_total_quantity_sku_id = @page.(Oracle).find_stock_sku(query_total_quantity,@sku_id)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @new_purchase_quantity_sku = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  @new_purchase_quantity_sku_id = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku_id)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @new_available_quantity_sku = @page.(Oracle).find_stock_sku(query_available_quantity,@sku) 
  @new_available_quantity_sku_id = @page.(Oracle).find_stock_sku(query_available_quantity,@sku_id)
  validate_purchase_sku = @old_purchase_quantity_sku[0][0] - @new_purchase_quantity_sku[0][0]
  validate_purchase_sku_id = @old_purchase_quantity_sku_id[0][0] - @new_purchase_quantity_sku_id[0][0]
  validate_available_sku = @new_available_quantity_sku[0][0] - @old_available_quantity_sku[0][0] 
  validate_available_sku_id = @new_available_quantity_sku_id[0][0] - @old_available_quantity_sku_id[0][0] 
  validate_total_sku = @old_total_quantity_sku[0][0] - @new_total_quantity_sku[0][0]
  validate_total_sku_id = @old_total_quantity_sku_id[0][0] - @new_total_quantity_sku_id[0][0]
  expect(validate_purchase_sku).to eq(1)
  expect(validate_purchase_sku_id).to eq(1)
  expect(validate_available_sku).to eq(1)
  expect(validate_available_sku_id).to eq(1)
  expect(validate_total_sku).to eq(0)
  expect(validate_total_sku_id).to eq(0)
end

Então("estoque alterado conforme regra do status PAY baixando o estoque referente aos dois itens diferentes") do
  query_total_quantity = QUERIES_ORACLE["TOTAL_QUANTITY"]
  @new_total_quantity_sku = @page.(Oracle).find_stock_sku(query_total_quantity,@sku)
  @new_total_quantity_sku_id = @page.(Oracle).find_stock_sku(query_total_quantity,@sku_id)
  query_purchase_quantity = QUERIES_ORACLE["PURCHASE_QUANTITY"]
  @new_purchase_quantity_sku = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku)
  @new_purchase_quantity_sku_id = @page.(Oracle).find_stock_sku(query_purchase_quantity,@sku_id)
  query_available_quantity = QUERIES_ORACLE["AVAILABLE_QUANTITY"]
  @new_available_quantity_sku = @page.(Oracle).find_stock_sku(query_available_quantity,@sku) 
  @new_available_quantity_sku_id = @page.(Oracle).find_stock_sku(query_available_quantity,@sku_id)
  validate_purchase_sku = @old_purchase_quantity_sku[0][0] - @new_purchase_quantity_sku[0][0]
  validate_purchase_sku_id = @old_purchase_quantity_sku_id[0][0] - @new_purchase_quantity_sku_id[0][0]
  validate_available_sku = @new_available_quantity_sku[0][0] - @old_available_quantity_sku[0][0] 
  validate_available_sku_id = @new_available_quantity_sku_id[0][0] - @old_available_quantity_sku_id[0][0] 
  validate_total_sku = @old_total_quantity_sku[0][0] - @new_total_quantity_sku[0][0]
  validate_total_sku_id = @old_total_quantity_sku_id[0][0] - @new_total_quantity_sku_id[0][0]
  expect(validate_purchase_sku).to eq(1)
  expect(validate_purchase_sku_id).to eq(1)
  expect(validate_available_sku).to eq(0)
  expect(validate_available_sku_id).to eq(0)
  expect(validate_total_sku).to eq(1)
  expect(validate_total_sku_id).to eq(1)
end
