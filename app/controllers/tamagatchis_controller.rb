class TamagatchisController < ApplicationController
  before_action :authorize
  before_action :set_tamagatchi, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order(id: :desc)
    @tamagatchi = Tamagatchi.find_by tid:current_user.id
#    session[:timg] = Tamagatchi.find_by(tid:current_user.tamagatchi_id).image if !session[:timg]
    session[:timg] = TamagatchiRank.find_by(rank:Tamagatchi.find_by(tid:current_user.tamagatchi_id).rank).image
#binding.pry
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
#binding.pry
    @tamagatchi = Tamagatchi.find(params[:id])

    @tamagatchi.level = 1
    @tamagatchi.rank = 1
    @tamagatchi.save
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

