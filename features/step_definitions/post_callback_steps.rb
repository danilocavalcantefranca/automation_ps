Quando("preencher o campo idlojista com lojista valido") do
  @value = 11077
  @response = @page.(PostCallback).post_callback(@value)
end

Entao("a URL callback do lojista deverá ser atualizada") do
  expect(@response.code).to eq(200)
  expect(@response.body).to be_empty
  url_callback = File.read('fixtures/url-callback.json')
  expect(@mpcompras.find_url_callback("callback", @value)[0]["urlCallBack"]).to eq(JSON.parse(url_callback)["url"])
end
