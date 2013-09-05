class Reservation < ActiveRecord::Base
  include Attributes::Strip
  include Reservations::Validation

  belongs_to :commerce
  belongs_to :product
  has_many :people, dependent: :destroy
  accepts_nested_attributes_for :people
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones

  strip_fields :loan
end
