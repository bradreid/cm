class AdminController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin
  
  
  def authenticate_admin
     if !current_user.try(:is_admin?)
       flash[:error] = t :access_err, :scope=>[:admin]
       redirect_to root_path
       return false
     end
  end
end
