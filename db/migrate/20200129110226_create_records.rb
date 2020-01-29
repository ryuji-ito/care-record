class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :content
      t.string :image
      t.references :floor, foreign_key: true
      t.timestamps
    end
  end
end
