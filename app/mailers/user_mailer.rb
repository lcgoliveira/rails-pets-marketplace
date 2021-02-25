class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.adoption.subject
  #
  def adoption
    @pet = params[:pet]
    @adoption = params[:adoption]
    @pet_owner = pet.user.name
    @pet_name = pet.name
    @greeting = "Hi"
    @message = @adoption.content
    @user_name = current_user.name

    mail to: @pet.user.email, subject: "#{@pet_owner} wants to adopt #{@pet_name}!"
  end
end
