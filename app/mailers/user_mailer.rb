class UserMailer < ApplicationMailer
	default from: 'deliciasdelajara@hotmail.com'

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
      :to => "deliciasdelajara@hotmail.com",
      :subject => "A new contact form message from #{name}")
  end

    def welcome_email(user)
    mail(:to => user.email,
      :subject => "Welcome to Delicias de la Jara!")
  end
end




