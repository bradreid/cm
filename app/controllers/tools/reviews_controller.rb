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
  
  def edit
    if current_user.is_admin?
      @review = Review.find(params[:id])
    else
      @review = current_user.reviews.find(params[:id])
    end
  end
  
  def update
    if current_user.is_admin?
      @review = Review.find(params[:id])
    else
      @review = current_user.reviews.find(params[:id])
    end
    
    if @review.update_attributes(params[:review])
      flash[:notice] = 'You have updated the review'
      redirect_to tool_path @review.tool
    else
      render 'edit'
    end    
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