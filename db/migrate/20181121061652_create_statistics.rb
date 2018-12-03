class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.integer :material_id, null: false
      t.datetime :time_input
      t.integer :mass, limit: 18
      t.integer :price, limit: 18
      t.integer :total, limit: 18
      t.timestamps
    end
  end
end
