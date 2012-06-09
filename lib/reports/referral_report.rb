class ReferralReport < Report
  
  def data    
    result = ActiveRecord::Base.connection.execute("select  srl.referrer AS referrer, count(*) from server_request_logs srl where srl.referrer IS NOT NULL and srl.created_at between '#{@from.to_s(:db)}' and '#{@to.to_s(:db)}' group by srl.referrer")
    result.to_a.map{|h| [h['referrer'], h['count'].to_i]}.sort{|x,y| y[1] <=> x[1]}
  end
  
end