class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter  :set_locale

  after_filter :log_request 
  
  helper_method :admin_selected?, :about_selected?, :search_selected?, :reviews_selected?, :guided_selected?
  

  def default_pagination_params
    {:page => params[:page], :per_page => 20}
  end
  
  def shared_url
    request.url.gsub(/\/(en|fr)/, '')
  end

  protected
  
  def default_url_options(options={})
    (current_user.try(:is_admin?) || Rails.env == 'development') ? { :locale => I18n.locale } : { :locale => :en}    
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
    (request.env['HTTP_REFERER'] =~ /localhost|rditools/).nil? ? request.referrer : nil
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
