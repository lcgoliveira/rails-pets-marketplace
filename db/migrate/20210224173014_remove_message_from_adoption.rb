class RemoveMessageFromAdoption < ActiveRecord::Migration[6.0]
  def change
    remove_column :adoptions, :message, "text"
  end
end
