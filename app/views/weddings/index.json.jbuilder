json.array!(@weddings) do |wedding|
  json.extract! wedding, :id
  json.url wedding_url(wedding, format: :json)
end
