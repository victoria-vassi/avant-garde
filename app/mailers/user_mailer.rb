class UserMailer < ApplicationMailer
  def pdf
    @user = params[:user]
    @certificate = params[:certificate]

    mail(
      to: @user.email,
      subject: 'Find your Investment Certificate here'
      )
  end
end
