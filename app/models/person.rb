class Person < ActiveRecord::Base
  include Attributes::Strip
  include People::Overrides
  include People::Validation

  strip_fields :name, :identification

  belongs_to :reservation
end
