class ChangesNullOfAdoptionsContent < ActiveRecord::Migration[6.0]
  def change
    remove_column :adoptions, :content, :text
    add_column :adoptions, :content, :text, null: false
  end
end
