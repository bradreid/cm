class Report
  include DateRangeParser
  
  def initialize(options={})
    unless options[:omit_date]
      if options[:from].kind_of?(Time) and options[:to].kind_of?(Time)
        @from_local = options[:from]
        @from = @from_local.utc
        @to_local = options[:to]
        @to = @to_local.utc
      else 
        set_date(options[:from] || options[:date])
      end 
    end 
  end  

private

  def set_date(range)
    begin
      unless range
        @from_local = 1.year.ago
        @to_local = Time.now + 1.day
        @from = @from_local
        @to = @to_local
        return 
      end
      @from, @to = parse_date(range, false)
      @from_local, @to_local = parse_date(range, false)
    rescue => e
      self.errors << e.message
    end 
  end  
end