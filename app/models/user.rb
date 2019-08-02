class User < ApplicationRecord

	has_many :food_intakes
	has_many :activities
	validates_uniqueness_of :user_name
	validates :user_name, presence: true
end
