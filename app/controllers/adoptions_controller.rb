class AdoptionsController < ApplicationController
  def new
    @pet = Pet.find(params[:pet_id])
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user = current_user
    @adoption.pet = Pet.find(params[:pet_id])
    if @adoption.save
      mail = UserMailer.with(pet: @adoption.pet, adoption: @adoption).adoption
      mail.deliver_now
      redirect_to pet_path(@adoption.pet), notice: "Adoption created, message sent"
    else
      render :new
    end
  end

  # def reply_request
  #   @adoption = Adoption.find(params[:id])
  #   @message = params[:reply_message]
  #   mail = UserMailer.with(message: @message, adoption: @adoption).reply
  #   mail.deliver_now
  #   redirect_to user_adoption_show_path notice: "reply sent"
  # end

  private

  def adoption_params
    params.require(:adoption).permit(:pet_id, :content)
  end
end
