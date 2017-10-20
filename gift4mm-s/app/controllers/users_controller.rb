class UsersController < ApplicationController

  def show
   # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      # Handle a successful update.
      #flash[:notice] = "successful password changed"
      flash[:success] = "successful password changed"

      #format.html { redirect_to @user, notice: 'password was successfully updated.' }
      render :show
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      redirect_to login_path
    else
      render 'new'
    end
  end
  
  #def showOrders
  #  @user = User.find(params[:id])
  #  @orders = @user.orders.paginate(page: params[:page])
  #end

  def logout
    session[:login] = nil
    session[:cart] = nil
    clear_cart
    session[:user_id] = -1
    @current_user = nil
    #flash[:notice] = "User logged out, cart reset."
    redirect_to :controller => :items
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    
  
end
