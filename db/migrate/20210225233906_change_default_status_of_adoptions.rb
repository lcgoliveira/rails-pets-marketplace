class ChangeDefaultStatusOfAdoptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :adoptions, :status, :string
    add_column :adoptions, :status, :string, default: 'open'
  end
end
