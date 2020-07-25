class UsersController < ApplicationController
  before_action :find_user, expect: :create

  def create
    @form = UserCreateForm.new(params)
    if @form.valid?
      @user = User.create(@form.attributes)
      UserService.create(@user, params[:create_company])
      render json: @user
    else
      render json: @form.errors
    end
  end

  def edit
    form = user.becomes(UserCreateForm)
    if form.valid?
      @user.update(form.attributes)
      render json: @user
    else
      render json: @form.errors
    end
  end

  def discard
    UserMutator.discard(@user)
  end

  def ban
    UserMutator.ban(@user)
  end

  def unban
    UserMutator.unban(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
