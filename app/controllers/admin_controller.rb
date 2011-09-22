class AdminController < ApplicationController
  before_filter :authenticate_user!, :set_area
  
private

  def set_area
    @area = :admin
  end
  
end