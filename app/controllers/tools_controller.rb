class ToolsController < ApplicationController
  before_filter :set_area
  
  def index
      
      unless params[:search].blank?
        search_tools
      end 
      
      unless params[:language].blank?
        @tools = arel_start.where(:language => params[:language])
      end
      
      unless params[:author].blank?
        @tools = arel_start.where(tools[:author].matches("%#{params[:author]}%"))
      end
      
      unless params[:time_to_use_as_seconds].blank?
        @tools = arel_start.where("time_to_use_as_seconds <= ?", params[:time_to_use_as_seconds].to_i.send(params[:time_to_use_type].downcase).seconds.to_i)
      end
      
      unless params[:rating].blank?
        @tools = arel_start.where("rating >= ?", params[:rating].to_i)
      end
      
      unless params[:from].blank?
        @tools = arel_start.where("date_created >= ?", Date.parse("1/1/#{params[:from]}"))
      end
      
      unless params[:to].blank?
         @tools = arel_start.where("date_created <= ?", Date.parse("12/31/#{params[:to]}"))
      end      
  end
  
  def show
    @tool = Tool.find(params[:id])
  end

private
  
  def arel_start
    @tools ||= Tool.paginate default_pagination_params.merge(:order => 'name asc')
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
    @tools = arel_start.where(sql)
  end
  
  def set_area
    @area = :search
  end
  
end