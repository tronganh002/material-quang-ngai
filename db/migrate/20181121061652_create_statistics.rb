class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.integer :material_id, null: false
      t.time :time_input
      t.integer :mass
      t.integer :price
      t.integer :total
      t.timestamps
    end
  end
end
