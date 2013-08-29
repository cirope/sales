class Category < ActiveRecord::Base
  include Attributes::Strip
  include Categories::Overrides
  include Categories::Validation

  strip_fields :name

  has_many :products, dependent: :destroy
end
