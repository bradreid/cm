class Admin::ToolsController < AdminController
  
  def index
    if params[:search]
      search_tools
      @tools = @tools.paginate(:page => params[:page], :per_page => 25)      
    else
      @tools = Tool.paginate(:page => params[:page], :per_page => 25)      
    end
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
      flash[:notice] = "You successfully updated the tool named #{@tool.name}"
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
    flash[:notice] = "You successfully deleted the tool named: #{@tool.name}"
    redirect_to admin_tools_path
  end
  
private
  def search_tools
    where_clause = []
    variables = []
    @tools = Tool.paginate(:page => params[:page], :per_page => 25)
    params[:search].split.each do |t|
      where_clause << "((UPPER(name) like UPPER(?)) OR (UPPER(description) like UPPER(?)))"
      variables << "%#{t}%"
      variables << "%#{t}%"      
    end
    sql = variables.inject([where_clause.join(' OR ')]){|sum, item|  sum << item}
    @tools = @tools.where(sql)
  end
  
end