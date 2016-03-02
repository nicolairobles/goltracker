class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :index]

  def new

  end

  def create
  	user = User.find_by(phone_number: params[:phone_number])
    if user and user.authenticate(params[:password])
  		sessions[:user_id] = user.id
  		redirect_to user_url
  	else
  		redirect_to "/", notice:"invalid username or password"
		end	 
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/", notice: "logged out"
  end
end
