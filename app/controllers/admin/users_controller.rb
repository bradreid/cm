class Admin::UsersController < AdminController
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 25, :order => 'username')  
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You successfully create a new user"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end
end