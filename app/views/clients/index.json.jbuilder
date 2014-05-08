json.array!(@clients) do |client|
  json.extract! client, :id, :name, :phone_number
  json.url client_url(client, format: :json)
end
