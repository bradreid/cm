class Admin::ToolsController < AdminController
  
  def index
    @tools = Tool.paginate(:page => params[:page], :per_page => 25)
  end
  
  def show
    @tool = Tool.find(params[:id])
  end
  
  def edit
    @tool = Tool.find(params[:id])
  end
  
  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes(params[:tool])
      flash[:notice] = "You successfully update the tool named #{@tool.name}"
      redirect_to admin_tool_path(@tool)
    else
      render 'edit'
    end
  end
  
  def new
    @tool = Tool.new
  end
  
  def create
    @tool = Tool.new(params[:tool])
    if @tool.save
      flash[:notice] = "You successfully created the new tool named #{@tool.name}"
      redirect_to admin_tools_path
    else
      render 'new'
    end
  end
  
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    flash[:notice] = "You successfully deleted teh tool named: #{@tool.name}"
    redirect_to admin_tools_path
  end
  
end