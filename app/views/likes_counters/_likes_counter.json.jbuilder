json.extract! likes_counter, :id, :user_id, :post_id, :created_at, :updated_at
json.url likes_counter_url(likes_counter, format: :json)
