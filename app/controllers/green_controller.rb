class GreenController < ApplicationController  
  
  
  def index
    @tools = Tool.paginate(:conditions => {:topic => 'Green'},:page => params[:page], :per_page => 25)
    unless params[:search].blank?
      search_tools
    end  
  end  
  
private
  def search_tools
    where_clause = []
    variables = []
    params[:search].split.each do |t|
      where_clause << "((UPPER(name) like UPPER(?)) OR (UPPER(description) like UPPER(?)))"
      variables << "%#{t}%"
      variables << "%#{t}%"      
    end
    sql = variables.inject([where_clause.join(' OR ')]){|sum, item|  sum << item}
    @tools = @tools.where(sql)
  end
end