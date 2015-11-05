class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc)
  end

  def new
  end

  def create
#    binding.pry
    @message = current_user.messages.new(message_params)
#    binding.pry
    # only store tweet-length posts for now
    @message.body = params[:body][0..139]
    @message.length = @message.body.length
#binding.pry
    if @message.save
      # after message is saved, update the tamagatchi
      @t = current_user.tamagatchi
      # try to feed the tamagatchi
      @result = @t.update_tamagatchi @message
      @t.save
#binding.pry
      session[:meal] = @result
      session[:timg] = TamagatchiRank.where("rank=#{@t.rank}").pluck(:image).pop

      redirect_to tamagatchis_path
    else
      render 'new'
    end
  end

  def delete_all
      Message.destroy_all
      redirect_to tamagatchis_path
  end

  private
    # Implement Strong Params
    def message_params
      params.require(:message).permit(:subject, :body, :is_sticky,:user_id)
    end
end
