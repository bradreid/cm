class Admin::Tools::ReviewsController < AdminController
  
  def toggle_active
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.find(params[:id])
    @review.update_attribute(:active, !@review.active?)
    if @review.active?
      flash[:notice] = 'You activated the review'      
    else
      flash[:notice] = 'You deactivated the review'       
    end
    redirect_to :back
  end
  
  
end