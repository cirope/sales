json.array!(@commerces) do |commerce|
  json.extract! commerce, :name, :address, :city, :state
  json.url commerce_url(commerce, format: :json)
end
