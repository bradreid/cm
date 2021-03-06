class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter  :redirect_in_production, :set_locale

  after_filter :log_request 
  
  helper_method :admin_selected?, :about_selected?, :search_selected?, :reviews_selected?, :guided_selected?, :shared_url, :captcha_verified?
  

  def default_pagination_params
    {:page => params[:page], :per_page => 20}
  end
  
  def shared_url
    request.url.gsub(/\/(en|fr)/, '')
  end

  protected

  def captcha_verified?
    session[:captcha_verified]
  end
  
  def redirect_in_production
    if Rails.env == 'production' && !(request.host =~ /(cm\.beyondthecube\.ca)/).nil?
      redirect_to 'http://www.choicematrix.ca'
      return false
    end
  end
  
  def default_url_options(options={})
    { :locale => I18n.locale }
  end  
  
  def set_locale
    I18n.locale = params[:locale] || request.compatible_language_from(%w{en fr}).try(:to_sym) || I18n.default_locale
  end  
  
  # Use basic authentication in my realm to get a user object.
  # Since this is a security filter - return false if the user is not
  # authenticated.
  def verify_access
    authenticate_or_request_with_http_basic("Documents Realm") do |username, password|
      username == 'rdi' && password == 'btc'
    end
  end  
  
  def referrer
    (request.env['HTTP_REFERER'] =~ /(localhost)|(rditools)|(choicematrix\.ca)/).nil? ? request.referrer : nil
  end
  
  def default_log_hash
    cookies[:id] ||= SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")
    { :user => current_user, :session_id => cookies[:id], :tic => @log_tic, :section => @log_section, 
      :review => @log_review, :search => params[:search], :referrer => self.referrer}
  end

  # everytime user makes request to server, request is saved to db
  def log_request
    ServerRequestLog.create! default_log_hash
  end
end
