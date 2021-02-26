class RemoveRatingFromAdoptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :adoptions, :rating, :integer
  end
end
