class PostCallback

  include HTTParty

  base_uri HOSTS["mp-compras"]
  headers 'Content-Type' => 'application/json'

  def post_callback(value, path = PATHS["post-callback"])
    json = File.read('fixtures/url-callback.json')
    json_parsed = JSON.parse(json)
    self.class.post("#{path}?idLojista=#{value}", body: json_parsed.to_json)
  end

end