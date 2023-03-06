json.array!(@e_markets) do |e_market|
  json.extract! e_market, :id, :protect_name, :protect_id, :specification, :price
  json.url e_market_url(e_market, format: :json)
end
