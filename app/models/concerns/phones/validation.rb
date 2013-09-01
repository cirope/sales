module Phones::Validation
  extend ActiveSupport::Concern

  included do
    validates :description, :phone, presence: true, length: { maximum: 255 }
  end
end
