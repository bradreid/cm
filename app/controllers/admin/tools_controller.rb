class Admin::ToolsController < AdminController
  
  def index
    if params[:search]
      @tools = Tool.search_by_name(params[:search], params[:search]).paginate default_pagination_params
    else
      @tools = Tool.paginate default_pagination_params.merge(:order => 'UPPER(name) asc')
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
      flash[:notice] = t(:tool_edit,:scope=>[:notices])+ " #{@tool.name}"
      redirect_to admin_tool_path(@tool)
    else
      render 'edit'
    end
  end
  
  def new
    @tool = Tool.new
  end
  
  def create
    @tool = Tool.new(params[:tool].merge(:created_by => current_user))
    if @tool.save
      flash[:notice] = t(:tool_create,:scope=>[:notices])+ " #{@tool.name}"
      redirect_to admin_tool_path(@tool)
    else
      render 'new'
    end
  end
  
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    flash[:notice] = t(:tool_del, :scope=>[:notices])+ " #{@tool.name}"
    redirect_to admin_tools_path
  end
  
private
  def search_tools
    where_clause = []
    variables = []
    @tools = Tool.paginate default_pagination_params
    params[:search].split.each do |t|
      where_clause << "((UPPER(name) like UPPER(?)) OR (UPPER(description) like UPPER(?)))"
      variables << "%#{t}%"
      variables << "%#{t}%"      
    end
    sql = variables.inject([where_clause.join(' AND ')]){|sum, item|  sum << item}
    @tools = @tools.where(sql)
  end
  
end
