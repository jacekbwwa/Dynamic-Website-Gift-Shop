class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.email=='admin@admin.com'
        session[:login] = 1
      else
        session[:login] = nil
      end
      
      clear_cart
      session[:user_id] = user.id
      redirect_to items_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
