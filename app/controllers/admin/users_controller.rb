class Admin::UsersController < AdminController
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 25, :order => 'username')  
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "You successfully updated the user account"
      redirect_to '/admin'
    else
      render 'edit'
    end
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