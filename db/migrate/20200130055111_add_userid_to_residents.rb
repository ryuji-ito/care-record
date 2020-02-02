class AddUseridToResidents < ActiveRecord::Migration[5.0]
  def change
    add_column :residents, :user_id, :integer
  end
end
