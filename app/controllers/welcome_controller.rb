class WelcomeController < ApplicationController
  
  def about
    @area = :about
  end
  
  def index
    @splash = true
  end
  
  
end