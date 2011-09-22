class GuidedQuestionsController < ApplicationController
  before_filter :set_area


private  
  def set_area
    @area = :guided
  end
  
end