class AddFlooridToResidents < ActiveRecord::Migration[5.0]
  def change
    add_column :residents, :floor_id, :integer
  end
end
