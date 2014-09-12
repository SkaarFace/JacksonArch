json.array!(@locations) do |location|
  json.extract! location, :id, :address_line_1, :address_line_2, :zip_code, :state, :city, :latitude, :longitude
  json.url location_url(location, format: :json)
end
