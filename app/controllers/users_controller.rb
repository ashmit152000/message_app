class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :show]
before_action :current_user_only, only: [:edit, :update, :destroy]
def new
	@user = User.new
end

def create
	@user = User.new(users_params)
	@user.save
	if @user.save
		session[:user_id] = @user.id
      	flash[:success] = "You are successfully signed up"
      	redirect_to users_path(@user)
    else
      	render 'new'
    end

	
end


def show


end




def destroy
	@user = User.find_by(params[:id])
	@user.destroy

end


def edit
		


end


def update

	if @user.update(users_params)
         flash[:success] = "Your profile was successfully updated"
        redirect_to user_path(@user)
    else
      render 'edit'
    end

end

def current_user_only
	if @user != current_user
		flash[:warning] = "You can  edit or delete only your profile"
        redirect_to root_path
	

	end

end


def set_user
	@user = User.find_by(id: params[:id])

end

private 
def users_params

params.require(:user).permit(:username, :password)

end



end