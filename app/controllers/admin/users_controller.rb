class Admin::UsersController < AdminController
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 25, :order => 'username')  
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank? 
      params[:user].delete(:password) 
      params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank? 
    end 
    if @user.update_attributes(params[:user])
      flash[:notice] = "You successfully updated the user account"
      redirect_to admin_users_path
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