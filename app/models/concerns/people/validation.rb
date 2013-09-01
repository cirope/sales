module People::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :identification, presence: true, length: { maximum: 255 }
  end
end
