class Admin::Stats::SectionsController < AdminController
  def new
    @data = SectionReport.new(params).data
  end
end
