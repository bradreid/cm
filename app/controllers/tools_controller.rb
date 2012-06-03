class ToolsController < ApplicationController
  def downloadtic
    @tool = Tool.find(params[:tool_id])
    fn = @tool.source_document.url
    fn.gsub!( ' ', '%20' )
    file = open( fn )
    send_data file.read, :type=> file.content_type, :filename => @tool.source_document_file_name
  end

  def index
      
      @log_section = 'search'  #log this request as a search 
      
      unless params[:search].blank?
        search_tools
      end 
      
      unless params[:language].blank?
        @tools = arel_start.where(:language => params[:language])
      end
      
      unless params[:author].blank?
        begin
          @tools = arel_start.search_by_author(params[:author]).paginate default_pagination_params
        rescue
          @tools = arel_start.where(["UPPER(author) like UPPER(?)", "%#{params[:author]}%"])
        end
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
    @log_tic = @tool # this is for the server request logs and reporting
    if params[:to_pdf].present?
      html = render_to_string 'shared/tic_pdf.html.haml', :layout => false
      kit  = PDFKit.new( html, :page_size => 'Letter' )
      kit.stylesheets << 'public/stylesheets/doc.css'
      send_data kit.to_pdf, :type => 'application/pdf', :filename => 'test.pdf', :disposition => 'inline'
      return
    else
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
end
