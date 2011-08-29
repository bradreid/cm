class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :verify_access
  
  protected
  
  # Use basic authentication in my realm to get a user object.
  # Since this is a security filter - return false if the user is not
  # authenticated.
  def verify_access
    authenticate_or_request_with_http_basic("Documents Realm") do |username, password|
      username == 'rdi' && password == 'btc'
    end
  end  
end
