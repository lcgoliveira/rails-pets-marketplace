class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :spot_user, only: %i[edit]

  def index
    @users = User.all.shuffle
  end

  def show
    @user = User.find(params[:id])
  end

  # device funcionality (new and create)

  def edit
    @user = spot_user
  end

  def update
    @user.update(user_params)
    if @users.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

  def spot_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :address)
  end
end
