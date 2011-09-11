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
  
end