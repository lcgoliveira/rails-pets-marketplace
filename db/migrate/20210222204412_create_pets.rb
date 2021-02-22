class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :type, null: false
      t.string :name
      t.integer :age
      t.text :description, null: false
      t.boolean :being_donated, default: true

      t.timestamps
    end
  end
end
