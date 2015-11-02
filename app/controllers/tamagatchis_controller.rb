class TamagatchisController < ApplicationController
  before_action :authorize
#  before_action :set_tamagatchi, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order(id: :desc)
    @tamagatchi = Tamagatchi.find_by tid:current_user.id
   end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

end

