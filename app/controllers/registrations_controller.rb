class RegistrationsController < Devise::RegistrationsController
  before_filter :remove_is_admin
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end
  
  def edit
    super
  end
  
private
  def remove_is_admin
    params[:user].try(:delete,:is_admin)
  end
end