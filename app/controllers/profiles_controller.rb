class ProfilesController < ApplicationController
  before_action :set_adoption_requests, only: %i[show]

  def show
    @user = current_user
    # @user_id = @user[:id]
    # @pets = Pet.where(user_id: @user_id)

  end

  def all_adoptions
    @user = User.find(params[:user_id])
  end

  def adoption_show
    @adoption = Adoption.find(params[:id])
  end

  private

  def set_adoption_requests
    @adoptions = []
    pets = Pet.where(user_id: current_user[:id])
    pets.each do |pet|
      @adoptions << Adoption.where(pet_id: pet[:id])
    end
  end

end
