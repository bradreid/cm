class Notifier < ActionMailer::Base
  default :from => "#{Rails.configuration.app_name} <no-reply@#{Rails.configuration.app_domain}>", 
          :to => User.where(:is_admin => true).map(&:email), 
          "Reply-To" =>  "#{Rails.configuration.app_name} <no-reply@#{Rails.configuration.app_domain}>" 
  
  def welcome(user)
    return unless user.email
    @user = user   
    subject = "Welcome to #{Rails.configuration.app_name}"
    mail(:to => user.email, :subject => subject)    
  end
  
  def new_user(user)
    @user = user   
    subject = "A new user signed up for #{Rails.configuration.app_name}"
    mail(:subject => subject)    
  end
  
  def new_tool(tool)
    @tool = tool
    users = User.where(:email_new_tools => true, :active => true, :is_admin => false).map(&:email).uniq.compact
    subject = "A new tool was created: #{@tool.name}"
    mail(:bcc => users, :subject => subject)      
  end
  
  def new_review(review)
    @review = review
    users = User.where(:email_new_reviews => true, :active => true, :is_admin => false).map(&:email).uniq.compact
    subject = "A tool was reviewed: #{@tool.name}"
    mail(:bcc => users, :subject => subject)    
  end
  
end