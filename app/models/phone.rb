class Phone < ActiveRecord::Base
  include Attributes::Strip
  include Phones::Overrides
  include Phones::Validation

  strip_fields :description, :phone
end
