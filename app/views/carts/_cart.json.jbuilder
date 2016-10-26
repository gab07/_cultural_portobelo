json.extract! cart, :id, :show, :created_at, :updated_at
json.url cart_url(cart, format: :json)