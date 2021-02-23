class AddColumnConcludedToAdoptions < ActiveRecord::Migration[6.1]
  def change
    add_column :adoptions, :concluded?, :boolean
    add_column :adoptions, :concluded_on, :datetime
  end
end
