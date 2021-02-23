class CreateAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :adoptions do |t|
      t.string :status
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :pet, null: false, foreign_key: { to_table: :pets }
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
