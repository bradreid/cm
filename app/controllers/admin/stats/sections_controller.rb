class Admin::Stats::SectionsController < AdminController
  def new
    @start_date, @data, @data2 = SectionReport.new(params).data
  end
end
