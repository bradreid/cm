class Admin::UsersController < AdminController
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 25, :order => 'username')  
  end
  
end