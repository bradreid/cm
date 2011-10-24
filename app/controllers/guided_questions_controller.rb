class GuidedQuestionsController < ApplicationController
  before_filter :set_area
  
  def index
    @tools = Tool.paginate(:conditions => {:why => params[:purpose]},:page => params[:page], :per_page => 25)
    respond_to do |wants|
      wants.js do
        render :update do |page|
          page.call "$('#search_results').html", render(:partial => 'search_results')
          page.call '$.Spinner.unspin'
        end
      end
    end    
  end


private  
  def set_area
    @area = :guided
  end
  
end