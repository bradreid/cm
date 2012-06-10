class Tools::ReviewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show,:new,:create]
  prepend_before_filter :authenticate_message, :except => [:show,:new,:create]
  
  def show
    @log_section = 'tic review'
    @tool = Tool.find(params[:tool_id])   
    @review = @tool.reviews.find(params[:id]) 
    @log_review = @review # this is for the server request logs and reporting
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
      flash[:notice] = t(:rev_edit,:scope=>[:notices])
      redirect_to tool_path @review.tool
    else
      render 'edit'
    end    
  end
  
  def toggle_active
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.find(params[:id])
    if current_user.is_admin? || @review.user == current_user
      @review.update_attribute(:active, !@review.active?)
      if @review.active?
        flash[:notice] = t(:rev_act,:scope=>[:notices])
      else
        flash[:notice] = t(:rev_deact,:scope=>[:notices])
      end
    else
      flash[:error] = t(:rev_chgerr,:scope=>[:notices])
    end
    redirect_to :back
  end  
  
  def create
    @tool = Tool.find(params[:tool_id])
    @review = @tool.reviews.build(params[:review].merge(:user => current_user))
    if @review.save
      flash[:notice] = t(:rev_submit,:scope=>[:notices])
      redirect_to tool_path(@tool)
    else
      render 'new'
    end
  end
  
private
  def authenticate_message
    flash[:warn] = t(:need_login,:scope=>[:notices]) unless current_user
  end
  
end
