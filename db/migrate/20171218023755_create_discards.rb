class CreateDiscards < ActiveRecord::Migration[5.0]
  def change
    create_table :discards do |t|
      t.references :animal, foreign_key: true
      t.references :cause, foreign_key: true
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end
