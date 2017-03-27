class UserMailer < ApplicationMailer
	default from: 'deliciasdelajara@hotmail.com'

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
      :to => "deliciasdelajara@hotmail.com",
      :subject => "A new contact form message from #{name}")
  end
end




