class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc)
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    @message.length = @message.body.length
    @message.user_id = current_user.id
    if @message.save
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
