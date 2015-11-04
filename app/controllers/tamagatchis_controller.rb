class TamagatchisController < ApplicationController
  before_action :authorize
  before_action :set_tamagatchi, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.limit(10).order(is_sticky: :desc, id: :desc)
    @tamagatchi = Tamagatchi.find_by tid:current_user.id
#    session[:timg] = Tamagatchi.find_by(tid:current_user.tamagatchi_id).image if !session[:timg]
    session[:timg] = TamagatchiRank.find_by(rank:Tamagatchi.find_by(tid:current_user.tamagatchi_id).rank).image
    @limit = 5
    @offset = 0
#binding.pry
    @offset = params[:offset].to_i if params[:offset]
   end

  def new
  end

  def create
  end

  def edit
  end

  def update
   respond_to do |format|
        if @tamagatchi.update(tamagatchi_params)
          format.html { redirect_to tamagatchis_path, alert: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @tamagatchi }
        else
          format.html { render :edit }
          format.json { render json: @tamagatchi.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
  end

  def reset
    @tamagatchi = Tamagatchi.find_by id:params[:id].to_i
#binding.pry
    @tamagatchi.level = 1
    @tamagatchi.rank = 1
    @tamagatchi.last_fed_on = DateTime.now
    @tamagatchi.save
    session[:meal] = ""
    redirect_to tamagatchis_path
  end

  def too_soon
    @tamagatchi = Tamagatchi.find_by id:params[:id].to_i

    @tamagatchi.last_fed_on = DateTime.now
    @tamagatchi.save
    session[:meal] = ""
    redirect_to tamagatchis_path
  end

  def too_long
    @tamagatchi = Tamagatchi.find_by id:params[:id].to_i

    @tamagatchi.last_fed_on = DateTime.now - 15000.seconds
    @tamagatchi.save
    session[:meal] = ""
    redirect_to tamagatchis_path
  end

  def just_right
#    binding.pry
    @tamagatchi = Tamagatchi.find_by id:params[:id].to_i

    @tamagatchi.last_fed_on = DateTime.now - 5400.seconds
    @tamagatchi.save
    session[:meal] = ""
    redirect_to tamagatchis_path
  end

  private

    def set_tamagatchi
      @tamagatchi = Tamagatchi.find(params[:id])
    end

    def tamagatchi_params
      params.require(:tamagatchi).permit(:name)
    end

end

