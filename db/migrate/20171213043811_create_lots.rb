class CreateLots < ActiveRecord::Migration[5.0]
  def change
    create_table :lots do |t|
      t.string :name
      t.text :description
      t.integer :phase

      t.timestamps
    end
  end
end
