class PageRequestReport < Report
  
  def data
    today = @to.to_date
    d = {}
    (0..num_days).each do |day|
      d.merge! today.to_s => [0,0]
      today = today.yesterday
    end
    offset = 'America/Winnipeg'
    result = ActiveRecord::Base.connection.execute("select  date(srl.created_at AT TIME ZONE '#{offset.to_s}') AS date, count(*) from server_request_logs srl where srl.created_at between '#{@from.to_s(:db)}' and '#{@to.to_s(:db)}' group by date(srl.created_at AT TIME ZONE '#{offset.to_s}')")
    result.each{|row| d[row['date']][0] = row['count'].to_i if d[row['date']]}
    
    result = ActiveRecord::Base.connection.execute("select date(srl.created_at AT TIME ZONE '#{offset.to_s}') AS date, count(distinct(srl.session_id)) from server_request_logs srl where srl.created_at between '#{@from.to_s(:db)}' and '#{@to.to_s(:db)}' group by date(srl.created_at AT TIME ZONE '#{offset.to_s}')")
    result.each{|row| d[row['date']][1] = row['count'].to_i if d[row['date']]}    
    d = d.sort
    return Date.parse(d.first.try(:first) || @from.to_s), d.map{|i| i[1][0]}, d.map{|i| i[1][1]}
  end
  
private

  def num_days
    (@to.to_date - (@from.to_date + 1.day)).to_i + 1
  end  
end