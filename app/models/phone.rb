class Phone < ApplicationRecord
  belongs_to :Contact

  validates :phone, uniqueness: { scope: :contact_id }
end
