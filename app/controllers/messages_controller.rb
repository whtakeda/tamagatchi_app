class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc)
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    @message.body = params[:body][0..139]
    @message.length = @message.body.length
    @message.user_id = current_user.id
    if @message.save
      # after message is saved, update the tamagatchi
      @t = Tamagatchi.find_by tid: current_user.id
      @t.level +=  @message.length
      # check if tamagatchi moves up a rank after updating level
      @t.last_fed_on = DateTime.now
      @t.save

      redirect_to tamagatchis_path
    else
      render 'new'
    end
  end

  private
    # Implement Strong Params
    def message_params
      params.require(:message).permit(:subject, :body)
    end
end
