Quando("informar o id {string} do lojista") do |seller|
  @response = @page.(TopSkuBySeller).get_top_skus(seller)
end

Quando("informar o id {string} do lojista com o campo {string} com valor {string}") do |seller, field, date|
  @response = @page.(TopSkuBySeller).get_top_skus_by_initial_date(seller, field, date)
  @ranking = @mpcompras.verify_top_sku("compra", date)
end

Quando("informar o id {string} do lojista com limite de {string}") do |seller, limit|
  @limit = limit
  @response = @page.(TopSkuBySeller).get_top_skus(seller, limit)
end

Quando("informar o id {string} do lojista com a ordenacao {string}") do |seller, ordination|
  @ordination = ordination
  @response = @page.(TopSkuBySeller).get_top_skus(seller, 5, ordination)
end

Quando("não informar id do lojista") do
  @response = @page.(TopSkuBySeller).get_top_skus
end

Então("deve me retornar os {int} skus mais vendidos") do |quantity|
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["rankings"].size).to eq(quantity)
  (quantity-1).times{|i|expect(@response.parsed_response["rankings"][i]["quantidadeTotal"]).to be >= @response.parsed_response["rankings"][i +1]["quantidadeTotal"]}
end

Então("deve me retornar os {int} skus mais vendidos a partir da data informada") do |quantity|
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["rankings"].size).to be(quantity)
  quantity.times {|i|expect(@response.parsed_response["rankings"][i]["skuId"]).to eq(@ranking[i]["sku"]["skuId"])
              expect(@response.parsed_response["rankings"][i]["skuIdLojista"]).to eq(@ranking[i]["sku"]["skuIdLojista"])
              expect(@response.parsed_response["rankings"][i]["descricao"]).to eq(@ranking[i]["sku"]["descricao"])
              expect(@response.parsed_response["rankings"][i]["quantidadeTotal"]).to eq(@ranking[i]["quantidadeTotal"])
              expect(@response.parsed_response["rankings"][i]["valorTotal"]).to eq(@ranking[i]["valorTotal"])
          }
end

Então("deve me retornar a quantidade informada de sku mais vendidos") do
  expect(@response.code).to eq(200)
  expect(@response.parsed_response["rankings"].size).to eq(@limit.to_i)
  (@limit.to_i-1).times{|i|expect(@response.parsed_response["rankings"][i]["quantidadeTotal"]).to be >= @response.parsed_response["rankings"][i +1]["quantidadeTotal"]}
end

Então("deve me retornar os skus com ordenacao correta") do
  expect(@response.code).to eq(200)
  if @ordination == "DESC"
    4.times{|i|expect(@response.parsed_response["rankings"][i]["quantidadeTotal"]).to be >= @response.parsed_response["rankings"][i +1]["quantidadeTotal"]}
  else
    4.times{|i|expect(@response.parsed_response["rankings"][i]["quantidadeTotal"]).to be <= @response.parsed_response["rankings"][i +1]["quantidadeTotal"]}
  end
end

Então("deve me retornar os skus com ordenacao default") do
  expect(@response.code).to eq(200)
  4.times{|i|expect(@response.parsed_response["rankings"][i]["quantidadeTotal"]).to be >= @response.parsed_response["rankings"][i +1]["quantidadeTotal"]}
end