class ChangesInActivityTable < ActiveRecord::Migration[5.1]
  def change
  	remove_column :activities, :food_intake_id
  	remove_reference :activities, :user, index: true 
  end
end
