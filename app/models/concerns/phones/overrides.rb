module Phones::Overrides
  extend ActiveSupport::Concern

  def to_s
    "#{description}: #{phone}"
  end
end
