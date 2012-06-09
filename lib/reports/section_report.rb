class SectionReport < Report
  
  def data    
    result = ActiveRecord::Base.connection.execute("select  srl.section AS section, count(*) from server_request_logs srl where srl.section IS NOT NULL and srl.created_at between '#{@from.to_s(:db)}' and '#{@to.to_s(:db)}' group by srl.section")
    result.to_a.map{|h| [h['section'], h['count'].to_i]}.sort{|x,y| y[1] <=> x[1]}
  end
 
end