class UsersController < ApplicationController
  before_action :authorize, except: [:index,:show,:create,:new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
      @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
   respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to tamagatchis_path, alert: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
=begin
   respond_to do |format|
      if !params[:changepw]
        if @user.update(user_params)
          format.html { redirect_to tamagatchis_path, alert: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        if @user.update(user_password_params)
          format.html { redirect_to tamagatchis_path, alert: 'Password was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
#          format.html { redirect_to edit_user_path(current_user, :changepw => true), alert: 'Unabled to update password.' }
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
=end
  end

  def destroy
  end

  private
    # Implement Strong Params
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_profile_params
      params.require(:user).permit(:name, :email)
    end

    def user_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
