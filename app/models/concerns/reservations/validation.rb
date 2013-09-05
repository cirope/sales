module Reservations::Validation
  extend ActiveSupport::Concern

  included do
    validates :loan_payments, :loan_amount, :advance, :deliver_at, :commerce_id, :product_id, presence: true
    validates :loan, :address, presence: true, length: { maximum: 255 }
    validates :loan_payments, numericality: { only_integer: true, greater_than: 0, less_than: 120 }
    validates :loan_amount, numericality: { greater_than: 0 }
    validates :deliver_at, timeliness: { type: :date, on_or_after: :today }
  end
end
