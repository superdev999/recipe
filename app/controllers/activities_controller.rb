class ActivitiesController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :check_params, only: 'create'
  

  def index
    @activities = @user.activities
  end

  def create
    @activity = @user.activities.find_or_initialize_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @activity.vitamin_c = @activity.vitamin_c.to_i + params['vitamin_c'].to_i
    @activity.vitamin_d = @activity.vitamin_d.to_i + params['vitamin_d'].to_i
    @activity.iron = @activity.iron.to_i + params['iron'].to_i
    unless @activity.save
      render json: { :success => false, :errors => @errors}, status: 403
    end    
  end

  private
    def check_params
      unless params['vitamin_c'].to_i.between?(1, 3) && params['vitamin_d'].to_i.between?(1, 3) && params['iron'].to_i.between?(1, 3)
        render json: { :success => false, :errors => 'Invalid Values.'}, status: 403
      end
    end

end
