class UsersController < ApplicationController
   skip_before_action :verify_authenticity_token  

  def create
    @user = User.new(user_name: params['name'])
    @user.height = params['height'].to_i if params['height'].present?
    @user.weight = params['weight'].to_i if params['weight'].present?
    unless @user.save
      @errors = @user.errors.full_messages
      render json: { :success => false, :errors => @errors}, status: 403
    end
  end

  def index
    @users = User.all
  end

  def calculate_recipe
    user = User.find params[:id]
    food_intake = user.food_intakes.last
    activity = user.activities.last
    @vitamin_c = 10 - (food_intake.vitamin_c -  activity.vitamin_c)
    @vitamin_d = 10 - (food_intake.vitamin_d -  activity.vitamin_d)
    @iron = 10 - (food_intake.iron -  activity.iron)
  end

end
