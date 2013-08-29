module Products::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :price, :stock, :category, presence: true
    validates :name, length: { maximum: 255 }, uniqueness: { scope: :category_id }
    validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 2147483648 }
    validates :price, numericality: { greater_than: 0 }
  end
end
