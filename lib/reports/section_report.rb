class SectionReport < Report
  
  def data    
    result = ActiveRecord::Base.connection.execute("select  srl.section AS section, count(*) from server_request_logs srl where srl.section IS NOT NULL and srl.section <> 'admin' and srl.created_at between '#{@from.to_s(:db)}' and '#{@to.to_s(:db)}' group by srl.section")
    r = result.to_a.map{|h| [h['section'], h['count'].to_i]}.sort{|x,y| y[1] <=> x[1]}
    total = r.inject(0){|s, v| s += v[1]}
    r.map{|i| [i[0].humanize,(i[1].to_f/total.to_f * 100).round(2)]}
  end
 
end
