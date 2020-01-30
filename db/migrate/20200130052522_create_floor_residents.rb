class CreateFloorResidents < ActiveRecord::Migration[5.0]
  def change
    create_table :floor_residents do |t|
      t.references :floor, foreign_key: true
      t.references :resident, foreign_key: true
      t.timestamps
    end
  end
end
