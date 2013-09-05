json.array!(@reservations) do |reservation|
  json.extract! reservation, :commerce_id, :loan, :loan_payments, :loan_amount, :advance, :product_id, :address, :deliver_at
  json.url reservation_url(reservation, format: :json)
end
