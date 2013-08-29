class Product < ActiveRecord::Base
  include Attributes::Strip
  include Products::Overrides
  include Products::Validation

  strip_fields :name

  belongs_to :category
end
