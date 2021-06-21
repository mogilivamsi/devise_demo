class UsersController < ApplicationController
  before_action :authenticate_user!

 private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio, :image)
  end
 def show
 end

 def update
   if current_user.update_attributes(user_params)
    render :show
 else
    render json: { errors: current_user.errors }, status: :unprocessable_entity
 end
 end



  end
