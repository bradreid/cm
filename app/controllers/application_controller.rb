class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :verify_access, :set_locale
  
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
    current_user.try(:is_admin?) ? { :locale => I18n.locale } : { :locale => :en}    
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
end
