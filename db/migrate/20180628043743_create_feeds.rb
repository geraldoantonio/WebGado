class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.references :animal, foreign_key: true
      t.references :food, foreign_key: true
      t.references :lot, foreign_key: true
      t.date :firstDate
      t.date :finaleDate

      t.timestamps
    end
  end
end
