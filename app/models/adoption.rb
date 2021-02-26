class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :content, presence: true
  validates :status, inclusion: { in: %w(open confirmed refused),
    message: "%{value} is not a valid status" }
end
