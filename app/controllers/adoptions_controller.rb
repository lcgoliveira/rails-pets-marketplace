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
    @user = User.find(params[:user_id])
  end

  def contact_owner
    user_email = current_user.email
    receiver = Pet.find(params[:user_id])
    receiver_email = User.where(user_id = receiver).email
    mail = Mail.new do
    from    'user_email'
    to      'receiver_email'
    subject 'User wants to adopt your pet'
    body    File.read('body.txt')
end

mail.to_s #=> "From: mikel@test.lindsaar.net\r\nTo: you@...
  end

  private

  def adoption_params
    params.require(:adoption).permit(:user_id, :pet_id)
  end

end
