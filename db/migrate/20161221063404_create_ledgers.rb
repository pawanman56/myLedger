class CreateLedgers < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.string :title
      t.integer :amount
      t.date :date
      t.timestamps null: false
    end
  end
end
