class UsersController < ApplicationController
  before_action :authorize, except: [:index,:show,:create,:new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
      @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.tamagatchi_id = @user.id
      @user.save
      create_tamagatchi
      # on user save, automatically create tamagatchi and assign the user to it
      flash[:notice] = "You have successfully signed up!"
      session[:error_messages] = ""
      redirect_to root_path
    else
#      binding.pry
        @str = ""
        if @user.errors.any?
          @user.errors.full_messages.each {|message|
#binding.pry
            @str = @str + message + "<br />"
          }
          session[:error_messages] = @str
        end
      redirect_to root_path(signup: "failed")
#      render 'new'
    end
  end

  def create_tamagatchi
    @t = Tamagatchi.new
    @t.level = 1
    @t.rank = 1
    @t.image = "tamagatchi.png"
    @t.last_fed_on = DateTime.now
    @t.tid = current_user.id
    @t.save
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
          format.html { redirect_to tamagatchis_path, alert: @user.errors.full_messages }
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
