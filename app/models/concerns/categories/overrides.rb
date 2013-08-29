module Categories::Overrides
  extend ActiveSupport::Concern

  def to_s
    name
  end
end
