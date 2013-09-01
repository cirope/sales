module Commerces::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :address, :city, :state, presence: true, length: { maximum: 255 }
    validates :name, uniqueness: { case_sensitive: false }
  end
end
