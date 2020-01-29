class AddUserToFloors < ActiveRecord::Migration[5.0]
  def change
    add_reference :floors, :user, foreign_key: true
  end
end
