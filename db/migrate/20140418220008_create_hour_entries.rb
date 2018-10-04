class CreateHourEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :hour_entries do |t|
      t.string :cid
      t.date :date
      t.integer :hour

      t.timestamps
    end
  end
end
