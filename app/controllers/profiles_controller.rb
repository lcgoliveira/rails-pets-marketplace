class ProfilesController < ApplicationController
  before_action :set_adoption_requests, only: %i[show]

  def show
    @user = current_user
  end

  def all_adoptions
    @user = current_user
    @pets = Pet.where(user_id: @user)
    @adoptions = Adoption.where(pet_id: @pets).where.not(status: 'open')
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

  def adoption_confirm
    @adoption = Adoption.find(params[:id])
    @adoption.status = 'confirmed'
    @adoption.concluded = 'true'
    @adoption.concluded_at = Date.today
    if @adoption.save
      redirect_to profiles_path, notice: "adoption confirmed, transaction concluded"
    else
      render :adoption_show, notice: "adoption couldn`t be confirmed, please try again"
    end
  end

  def adoption_refuse
    @adoption = Adoption.find(params[:id])
    @adoption.status = 'refused'
    @adoption.concluded = 'true'
    @adoption.concluded_at = Date.today
    if @adoption.save
      redirect_to profiles_path, notice: "adoption refused, transaction concluded"
    else
      render :adoption_show, notice: "adoption couldn`t be refused, please try again"
    end
  end

  private

  def set_adoption_requests
    pets = current_user.pet_ids
    @pets_adoptions = Adoption.where(pet_id: pets, status: 'open')
  end

  def adoption_params
    params.require(:adoption).permit(:id)
  end
end
