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
        format.html { redirect_to tamagatchis_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    # Implement Strong Params
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
