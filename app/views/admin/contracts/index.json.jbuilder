json.array!(@contracts) do |contract|
  json.extract! contract, :id
  json.url admin_contract_url(contract, format: :json)
end
