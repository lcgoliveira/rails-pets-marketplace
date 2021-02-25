class ProfilesController < ApplicationController
  before_action :set_adoption_requests, only: %i[show]

  def show
    @user = current_user
  end

  def all_adoptions
    @user = User.find(params[:user_id])
  end

  def adoption_show
    @adoption = Adoption.find(params[:user_id])
  end

  private

  def set_adoption_requests
    pets = current_user.pets
    @pets_adoptions = pets.map do |pet|
      Adoption.where(pet_id: pet[:id])
    end
  end

  def adoption_params
    params.require(:adoption).permit(:id)
  end

end
