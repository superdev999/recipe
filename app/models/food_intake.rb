class FoodIntake < ApplicationRecord

	belongs_to :user
	validates :vitamin_c, :vitamin_d, :iron, presence: true
end
