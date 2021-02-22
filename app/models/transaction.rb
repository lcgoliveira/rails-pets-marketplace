class Transaction < ApplicationRecord
  belongs_to :donators_id
  belongs_to :adoptors_id
  belongs_to :pets_id
end
