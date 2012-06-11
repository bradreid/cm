class SearchTermReport < Report
  
  def data    
    result = ActiveRecord::Base.connection.execute("select  srl.search AS search, count(*) as count from server_request_logs srl where srl.section <> 'admin' and srl.search IS NOT NULL and srl.created_at between '#{@from.to_s(:db)}' and '#{@to.to_s(:db)}' group by srl.search order by count desc, srl.search")
    result.to_a.map{|h| [h['search'], h['count'].to_i]}
  end
 
end