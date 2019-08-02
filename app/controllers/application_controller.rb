class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user

  def get_user
  	if params['user_id'].present?
  		@user = User.find_by_id(params['user_id']) 
  		render json: { :success => false, :errors => 'User not found.'} unless @user.present?
  	end
  end
end
