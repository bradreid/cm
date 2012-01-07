class PhasesController < ApplicationController  
  def index
    @tools = Tool.paginate(default_pagination_params.merge(:conditions => {:why => params[:purpose]}, :order => 'name asc'))
    respond_to do |wants|
      wants.html{render 'new'}
      wants.js do
        render :update do |page|
          page.call "$('#search_results').html", render(:partial => '/shared/tic_search_results', :locals => {:remote => true})
          page.call '$.Spinner.unspin'
        end
      end
    end    
  end
end