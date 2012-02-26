class Tools::ReviewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  prepend_before_filter :authenticate_message, :except => [:show]
  
  def show
    @tool = Tool.find(params[:tool_id])   
    @review = @tool.reviews.find(params[:id]) 
  end
  
  def new
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.build
  end
  
  def create
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.build(params[:review].merge(:user => current_user))
    if @review.save
      flash[:notice] = "You have successfully submitted your tool review"
      redirect_to tool_path(@tool)
    else
      render 'new'
    end
  end
  
private
  def authenticate_message
    flash[:warn] = 'You must login or sign up for an account to review a tool' unless current_user
  end
  
end