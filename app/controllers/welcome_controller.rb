class WelcomeController < ApplicationController
  
  def index
    @log_section = 'front_page'
    @splash = true
  end 
end