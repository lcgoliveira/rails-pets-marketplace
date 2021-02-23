class AddConcludedAtToAdoption < ActiveRecord::Migration[6.0]
  def change
    add_column :adoptions, :concluded_at, :date
  end
end
