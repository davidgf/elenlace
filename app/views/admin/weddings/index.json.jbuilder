json.array!(@admin_weddings) do |admin_wedding|
  json.extract! admin_wedding, :id
  json.url admin_wedding_url(admin_wedding, format: :json)
end
