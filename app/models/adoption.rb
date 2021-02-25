class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :content, presence: true
 # validates :user_id, uniqueness: { scope: :pet_id }
end
