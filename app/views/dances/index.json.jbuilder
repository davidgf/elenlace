json.array!(@dances) do |dance|
  json.extract! dance, :id, :user_id, :partner_id, :time
  json.url dance_url(dance, format: :json)
end
