class UserMailer < ApplicationMailer
  def PDF
    @greeting = "Dear"
    @user = current.user
    mail(
      to: @user.email,
      subject: 'Find your Investment Certificate here'
      )
  end
end
