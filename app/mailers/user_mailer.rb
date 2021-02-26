class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.adoption.subject
  #
  def adoption
    @pet = params[:pet]
    @adoption = params[:adoption]
    @pet_owner = @pet.user.first_name
    @pet_name = @pet.name
    @greeting = "Hi"
    @message = @adoption.content
    @user_name = @adoption.user.first_name
    mail to: @pet.user.email, subject: "#{@user_name} wants to adopt #{@pet_name}!"
  end

  def reply
    @adoption = params[:adoption]
    @pet_owner = @adoption.pet.user.first_name
    @pet_name = @adoption.pet.name
    @greeting = "Hi"
    @message = params[:message]
    @user_name = @adoption.user.first_name
    mail to: @adoption.user.email, subject: "Re: #{@user_name} wants to adopt #{@pet_name}!"
  end


end
