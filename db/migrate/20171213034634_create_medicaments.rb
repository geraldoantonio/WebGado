class CreateMedicaments < ActiveRecord::Migration[5.0]
  def change
    create_table :medicaments do |t|
      t.string :description
      t.integer :carencyday
      t.integer :measure
      t.text :usemode

      t.timestamps
    end
  end
end
