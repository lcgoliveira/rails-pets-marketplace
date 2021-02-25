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

  def reply_request
    @adoption = Adoption.find(params[:id])
    @message = params[:reply_message]
    mail = UserMailer.with(message: @message, adoption: @adoption).reply
    mail.deliver_now
    render :adoption_show, notice: "reply sent"
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

  # def adoption_edit

  # end

  # def adoption_update

  # end
end
