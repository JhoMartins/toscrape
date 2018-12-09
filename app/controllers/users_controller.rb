class UsersController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors
    end
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
  