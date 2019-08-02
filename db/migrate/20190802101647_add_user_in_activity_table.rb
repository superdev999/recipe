class AddUserInActivityTable < ActiveRecord::Migration[5.1]
  def change
  	add_reference :activities, :user, index: true 
  end
end
