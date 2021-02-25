class AddMessageToAdoption < ActiveRecord::Migration[6.0]
  def change
    add_column :adoptions, :message, :text, null: false
  end
end
