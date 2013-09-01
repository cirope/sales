class Commerce < ActiveRecord::Base
  include Attributes::Strip
  include Commerces::Overrides
  include Commerces::Validation

  strip_fields :name
end
