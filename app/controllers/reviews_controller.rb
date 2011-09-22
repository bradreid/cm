class ReviewsController < ApplicationController
  before_filter :set_area
  

private  
  def set_area
    @area = :reviews
  end
  
end