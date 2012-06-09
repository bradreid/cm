class Admin::Stats::SearchTermsController < AdminController
  def new
    @data = SearchTermReport.new(params).data
  end
end
