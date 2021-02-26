class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :adoptions

  validates :name, presence: true
  validates :description, presence: true
end
