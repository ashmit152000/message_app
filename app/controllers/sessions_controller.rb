class SessionsController < ApplicationController
  def new
  end


  def ajaxreply
    

    user = User.new(username: params[:username], password: params[:password])
    user.save

    if user.save
      session[:user_id] = user.id
      puts session[:user_id]
      redirect_to root_path
    else
      flash.now[:danger] = "Username already taken"
      render 'new'

    end

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


def destroy
  session[:user_id] = nil 
  flash[:success] = "You are successfully logged out. Come back soon :)"
  redirect_to login_path
end
end


