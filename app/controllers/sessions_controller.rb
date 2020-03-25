class SessionsController < ApplicationController
  def new
  end


  def ajaxreply
    puts "************************************"
    puts params[:username]
    puts "************************************"

    user = User.find_by(username: params[:username])
    puts "************************************"
    puts user.id
    puts "************************************"

  end

  def create 
  	user = User.find_by(username: params[:session][:username])

  	if user && user.authenticate(params[:session][:password])
  		session[:user_id] = user.id

  		respond_to do |format|
  			format.html {redirect_to root_path}
  			format.js
  		end
  		
  		flash[:success] = "You are successfully logged in"
  		
  	else
  		render 'new'
  		flash.now[:danger] = "Please check your username or password"

  	end

  end
end
