class CreateFoodIntakes < ActiveRecord::Migration[5.1]
  def change
    create_table :food_intakes do |t|

      t.integer :vitamin_c
      t.integer :vitamin_d
      t.integer :iron
      t.references :user ,index: true

      t.timestamps
    end
  end
end
