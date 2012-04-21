class Admin::Tools::ReviewsController < AdminController
  
  def toggle_active
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.find(params[:id])
    @review.update_attribute(:active, !@review.active?)
    if @review.active?
      flash[:notice] = t :rev_act, :scope=>[:notices]
    else
      flash[:notice] = t :rev_deact, :scope=>[:notices]
    end
    redirect_to :back
  end
  
  
end
