class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def all_adoptions
    @user = User.find(params[:user_id])
  end

end
