class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc)
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    # only store tweet-length posts for now
    @message.body = params[:body][0..139]
    @message.length = @message.body.length
#binding.pry
    @message.user_id = current_user.id
    if @message.save
      # after message is saved, update the tamagatchi
      @t = Tamagatchi.find_by tid: current_user.id
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
      params.require(:message).permit(:subject, :body, :is_sticky)
    end
end
