class UsersController < ApplicationController
  before_action :authorize, except: [:create,:new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
      @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.save
      @t = @user.create_tamagatchi
      @t.level = 1
      @t.rank = 1
      @t.name = "Toonces"
      @t.last_fed_on = DateTime.now
      if @t.save
        flash[:notice] = "You have successfully signed up!"
        redirect_to root_path
      else
        User.delete @user.id
        redirect_to root_path(signup: "failed"), alert: @t.errors.full_messages
      end
    else
      redirect_to root_path(signup: "failed"), alert: @user.errors.full_messages
#      render 'new'
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
          if (params[:user][:password])
            format.html { redirect_to tamagatchis_path(success:"1"), alert: ["Password successfully changed"] }
          else
            format.html { redirect_to tamagatchis_path(success:"1"), alert: ["Profile successfully updated"] }
          end
          format.json { render :show, status: :ok, location: @user }
        else
          if (params[:user][:password])
            format.html { redirect_to tamagatchis_path(failpw:"1"), alert: @user.errors.full_messages }
          else
            format.html { redirect_to tamagatchis_path(failprofile:"1"), alert: @user.errors.full_messages }
          end
#          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    session.clear
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
