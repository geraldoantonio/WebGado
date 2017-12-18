class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :proprietary
      t.integer :size
      t.string :phone
      t.string :state
      t.string :city
      t.string :comunity
      t.string :complement
      t.boolean :active

      t.timestamps
    end
  end
end
