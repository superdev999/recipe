class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|

    	t.integer :vitamin_c
      t.integer :vitamin_d
      t.integer :iron
      t.references :food_intake ,index: true

      t.timestamps
    end
  end
end
