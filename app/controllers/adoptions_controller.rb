class AdoptionsController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @user = User.find(params[:user_id])
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)

    @pet = Pet.find(params[:pet_id])
  end

  def all_adoptions
    @all_adoptions = Adoption.where(user: params[:user_id])
  end

  private

  def adoption_params
    params.require(:adoption).permit(:user_id, :pet_id)
  end

end
