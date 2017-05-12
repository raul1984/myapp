class UserMailer < ApplicationMailer
	default from: 'deliciasdelajara@hotmail.com'

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
      :to => "deliciasdelajara@hotmail.com",
      :subject => "A new contact form message from #{name}")
  end

   def welcome(user)
     @user = user
    mail(:to => user.email,
         :subject => "¡Bienvenidos a Delicias de la Jara!")
  end

   def successful_payment(user, product)
    @user = user
    @product = product
    mail(:to => user.email,
        :subject => "Confirmation of payment #{product.name}")
  end
end




