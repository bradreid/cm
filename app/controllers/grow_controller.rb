class GrowController < ApplicationController  
  before_filter :set_section
  
  def index
    @tools = Tool.paginate(default_pagination_params.merge(:conditions => {:topic => 'Grow'}, :order => 'name asc'))
    unless params[:search].blank?
      search_tools
    end  
  end  

private
  def arel_start
     @tools ||= Tool.paginate default_pagination_params
   end

   def search_tools
     where_clause = []
     variables = []
     params[:search].split.each do |t|
       where_clause << "((UPPER(name) like UPPER(?)) OR (UPPER(description) like UPPER(?)))"
       variables << "%#{t}%"
       variables << "%#{t}%"      
     end
     sql = variables.inject([where_clause.join(' AND ')]){|sum, item|  sum << item}
     begin
       @tools = arel_start.search_by_name_or_description(params[:search], params[:search]).paginate default_pagination_params
     rescue
       @tools = arel_start.where(sql)
       @tools = @tools.order('name asc')      
     end
   end  
   
   def set_section
     @log_section = 'grow'
   end   
end