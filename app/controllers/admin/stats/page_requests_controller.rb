class Admin::Stats::PageRequestsController < AdminController
  def new
    @start_date, @data, @data2, @unique_users = PageRequestReport.new(params).data
  end
end
