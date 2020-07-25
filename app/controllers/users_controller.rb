class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if user.save
      render json: @user
    else
      render json: @user.errors
    end
  end
end
