json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :email, :full_name, :company, :stripe_customer_token, :product_id
  json.url subscription_url(subscription, format: :json)
end
