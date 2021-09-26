json.extract! stock_item, :id, :store_id, :product_id, :stock, :created_at, :updated_at
json.url stock_item_url(stock_item, format: :json)
