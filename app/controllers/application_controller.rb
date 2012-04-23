class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :verify_access, :set_locale

  after_filter :log_request 
  
  helper_method :admin_selected?, :about_selected?, :search_selected?, :reviews_selected?, :guided_selected?
  
  def admin_selected?
    @area == :admin
  end
  
  def about_selected?
    @area == :about
  end
  
  def search_selected?
    @area == :search
  end
  
  def reviews_selected?
    @area == :reviews
  end
  
  def guided_selected?
    @area == :guided
  end
  
  def default_pagination_params
    {:page => params[:page], :per_page => 20}
  end
  
  protected
  
  def default_url_options(options={})
    (current_user.try(:is_admin?) || Rails.env == 'development') ? { :locale => I18n.locale } : { :locale => :en}    
  end  
  
  def set_locale
    I18n.locale = params[:locale] || request.compatible_language_from(%w{en fr}).to_sym || I18n.default_locale
  end  
  
  # Use basic authentication in my realm to get a user object.
  # Since this is a security filter - return false if the user is not
  # authenticated.
  def verify_access
    authenticate_or_request_with_http_basic("Documents Realm") do |username, password|
      username == 'rdi' && password == 'btc'
    end
  end  
  
  def save_referrer?
    (request.env['HTTP_REFERER'] =~ /localhost|beyondthecube/).nil?
  end
  
  def default_log_hash
    cookies[:id] ||= ActiveSupport::SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")
    h = {:user => current_user, :session_id => cookies[:id]}
    h.merge!(:search => params[:search]) if params[:search]
    h.merge!(:referrer => request.env['HTTP_REFERER']) if save_referrer?
    h.merge!(:tic => @log_tic) if @log_tic
    h
  end

  # everytime user makes request to server, request is saved to db
  def log_request
    ServerRequestLog.create! default_log_hash
  end
end
