class Admin::Stats::ReferralsController < AdminController
  def new
    @data = ReferralReport.new(params).data
  end
end
