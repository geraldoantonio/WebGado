class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
      t.references :animal, foreign_key: true
      t.references :medicament, foreign_key: true
      t.date :applied
      t.integer :disease

      t.timestamps
    end
  end
end
