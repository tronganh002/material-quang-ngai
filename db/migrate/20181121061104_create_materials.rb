class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :type_mt, default: 0
      t.timestamps
    end
  end
end
