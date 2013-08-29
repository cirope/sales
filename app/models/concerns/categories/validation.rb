module Categories::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  end
end
