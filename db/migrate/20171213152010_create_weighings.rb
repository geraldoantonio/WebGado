class CreateWeighings < ActiveRecord::Migration[5.0]
  def change
    create_table :weighings do |t|
      t.references :animal, foreign_key: true
      t.float :weight
      t.float :height
      t.date :checked

      t.timestamps
    end
  end
end
