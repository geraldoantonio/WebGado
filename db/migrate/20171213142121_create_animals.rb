class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.references :property, foreign_key: true
      t.string :earring
      t.string :name
      t.references :lot, foreign_key: true
      t.date :birth
      t.integer :breed
      t.integer :blood
      t.integer :sex
      t.integer :source
      t.integer :price
      t.boolean :active

      t.timestamps
    end
  end
end
