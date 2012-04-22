class Admin::Stats::PageRequestsController < AdminController
  def new
    @start_date, @data = PageRequestReport.new(params).data
  end
end
