class AddWriternameToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :writer_name, :string
  end
end
