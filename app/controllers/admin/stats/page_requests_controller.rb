class Admin::Stats::PageRequestsController < AdminController
  def new
<<<<<<< HEAD
 
=======
    @start_date, @data, @data2 = PageRequestReport.new(params).data
>>>>>>> 68345b738922fa5a6d0fe69b43914b7b91a8f4e1
  end
end
