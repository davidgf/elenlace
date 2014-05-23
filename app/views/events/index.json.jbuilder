json.array!(@events) do |event|
  json.extract! event, :id, :datetime, :description
  json.url event_url(event, format: :json)
end
