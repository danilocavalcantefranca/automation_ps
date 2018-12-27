Dado("que eu tenha uma notificação com erro de envio {int}") do |id_notification|
  @id_notification = id_notification 
  query_notification = QUERIES["find_notification"]
  query_notification["tipoIntegracao"] = id_notification
  @notification = @mpcompras.find_anything("auditoriaIntegracaoFront", query_notification)
end

Dado("que eu tenha uma notificacao {int} e informe um numero de pedido") do |id_notification|
  @id_notification = id_notification
  query_notification = QUERIES["find_type_integration"]
  query_notification["tipoIntegracao"] = id_notification
  @notification = @mpcompras.find_anything("auditoriaIntegracaoFront", query_notification)
end

Quando("realizar o get no endpoint") do
  query_notification = QUERIES["find_notification"]
  query_notification["tipoIntegracao"] = @id_notification
  @return_mongo = @mpcompras.count_notification("auditoriaIntegracaoFront", query_notification)
  parameters = {"limit": @return_mongo}
  @response = @page.(Notification).get_notification_62(parameters)
end

Quando("realizar o get no endpoint da {int}") do |id_notification|
  @id_notification = id_notification
  query_notification = QUERIES["find_notification"]
  query_notification["tipoIntegracao"] = id_notification
  @return_mongo = @mpcompras.count_notification("auditoriaIntegracaoFront", query_notification)
  parameters = {"limit": @return_mongo}
  @response = @page.(Notification).get_notification_63(parameters)
end

Quando("realizar o get no endpoint passando o numero do pedido") do
  parameters = {"id": @notification["idPedido"]}
  @response = @page.(Notification).get_notification_id_62(parameters)
end

Quando("realizar o get no endpoint da {int} passando o numero do pedido") do |int|
  parameters = {"id": @notification["idPedido"]}
  @response = @page.(Notification).get_notification_id_63(parameters)
end

Entao("devo ter aumentado meu numero de tentativas") do
  query_notification = QUERIES["find_order_id_notification"]
  query_notification["idPedido"] = @notification["idPedido"]
  query_notification["tipoIntegracao"] = @id_notification
  return_get = @mpcompras.find_anything("auditoriaIntegracaoFront", query_notification)
  expect(@notification["tentativas"]).to be < return_get["tentativas"]   
end