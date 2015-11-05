class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to tamagatchis_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid login credentials - try again!'
      redirect_to root_path(login: "failed"), alert: ['Invalid login credentials - try again!']
#      format.html { redirect_to '/', alert: "Error" }
#      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
