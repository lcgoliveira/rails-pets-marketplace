class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :description, presence: true
  validates :user_id, uniqueness: { scope: :pet_id }
end
