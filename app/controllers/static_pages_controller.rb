class StaticPagesController < ApplicationController
  def index
  end
<<<<<<< HEAD

  def thank_you   
  @name = params[:name]   
  @email = params[:email]   
  @message = params[:message]   
  ActionMailer::Base.mail(:from => @email,       
    :to => 'deliciasdelajara@hotmail.com',       
    :subject => "A new contact form message from #{@name}",       
    :body => @message).deliver_now 
  end

end


=======
  

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
>>>>>>> master
