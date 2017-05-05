class UserMailer < ApplicationMailer
	default from: 'deliciasdelajara@hotmail.com'

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
      :to => "deliciasdelajara@hotmail.com",
      :subject => "A new contact form message from #{name}")
  end

    def welcome(user)
        @appname = "DElICIAS DE LA JARA"
      @user =user
        mail(:to => @user.email,
                                :subject => "Welcome to #{@appname}!")
      UserMailer.welcome(@user).deliver.now
  end

    def order_complete(user, product)
      @user = user
      @product = product
      mail(to: @user.email, subject: 'Thank you for your order!')
  end

    def thank_you
      @name = params[:name]
      @email = params[:email]
      @message = params[:message]
      UserMailer.contact_form(@email, @name, @message).deliver_now
    end

end




