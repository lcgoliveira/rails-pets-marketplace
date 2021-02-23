class AddConcludedToAdoption < ActiveRecord::Migration[6.0]
  def change
    add_column :adoptions, :concluded, :boolean, default: false
  end
end
