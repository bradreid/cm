class Tools::ReviewsController < ApplicationController
  
  def new
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.build
  end
  
  def create
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.build(params[:review])
    if @review.save
      flash[:notice] = "You have successfully submitted your tool review"
      redirect_to tool_path(@tool)
    else
      render 'new'
    end
  end
  
end