class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :status
      t.references :donator, null: false, foreign_key: { to_table: :users }
      t.references :adoptor, null: false, foreign_key: { to_table: :users }
      t.references :pet, null: false, foreign_key: { to_table: :pets }
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
