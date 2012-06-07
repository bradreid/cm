class Notifier < ActionMailer::Base
  default :from => "#{Rails.configuration.app_name} no-reply@#{Rails.configuration.app_domain}", 
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
    users = User.where(:email_new_user => true, :active => true, :is_admin => true).map(&:email).uniq.compact
    subject = "A new user signed up for #{Rails.configuration.app_name}"
    return if users.empty?
    mail(:to => nil, :bcc => users, :subject => subject)    
  end
  
  def new_tool(tool)
    @tool = tool
    users = User.where(:email_new_tools => true, :active => true).map(&:email).uniq.compact
    subject = "A new tool was created: #{@tool.name}"
    return if users.empty?
    mail(:to => nil, :bcc => users, :subject => subject)      
  end
  
  def new_review(review)
    @review = review
    users = User.where(:email_new_reviews => true, :active => true).map(&:email).uniq.compact
    subject = "A tool was reviewed: #{@review.tool.name}"
    return if users.empty?
    mail(:to => nil, :bcc => users, :subject => subject)    
  end
  
end