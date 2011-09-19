class ToolsController < ApplicationController
  
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

private
  def search_tools
    where_clause = []
    variables = []
    @tools = Tool.paginate(:page => params[:page], :per_page => 25)
    params[:search].split.each do |t|
      where_clause << "((name like ?) OR (description like ?))"
      variables << "%#{t}%"
      variables << "%#{t}%"      
    end
    sql = variables.inject([where_clause.join(' OR ')]){|sum, item|  sum << item}
    @tools = @tools.where(sql)
  end
  
end