class ToolsController < ApplicationController
  before_filter :set_area
  
  def index
    if params[:search]
      search_tools
      @tools = @tools.paginate(:page => params[:page], :per_page => 25)          
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
      where_clause << "((UPPER(name) like UPPER(?)) OR (UPPER(description) like UPPER(?)))"
      variables << "%#{t}%"
      variables << "%#{t}%"      
    end
    sql = variables.inject([where_clause.join(' OR ')]){|sum, item|  sum << item}
    @tools = @tools.where(sql)
  end
  
  def set_area
    @area = :search
  end
  
end