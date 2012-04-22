class Admin::Stats::PageRequestsController < AdminController
  def new
    @start_date, @data, @data2 = PageRequestReport.new(params).data
  end
end
