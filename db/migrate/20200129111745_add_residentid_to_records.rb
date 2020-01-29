class AddResidentidToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :resident_id, :integer
  end
end
