class FoodIntakesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_params, only: 'create'

  def index
    @food_intakes = @user.food_intakes
  end

  def create
    @food_intake = @user.food_intakes.find_or_initialize_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @food_intake.vitamin_c = @food_intake.vitamin_c.to_i + params['vitamin_c'].to_i
    @food_intake.vitamin_d = @food_intake.vitamin_d.to_i + params['vitamin_d'].to_i
    @food_intake.iron = @food_intake.iron.to_i + params['iron'].to_i
    unless @food_intake.save
      render json: { :success => false, :errors => @errors}, status: 403
    end
  end


  private

    def check_params
      unless params['vitamin_c'].to_i.between?(4, 10) && params['vitamin_d'].to_i.between?(4, 10) && params['iron'].to_i.between?(4, 10)
        render json: { :success => false, :errors => 'Invalid Values.'}, status: 403
      end
    end

end
