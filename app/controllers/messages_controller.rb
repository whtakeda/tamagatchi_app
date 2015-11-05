class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(id: :desc)
  end

  def new
  end

  def create
    @message = current_user.messages.new(message_params)
    # only store tweet-length posts for now
    @message.body = params[:body][0..139]
    @message.length = @message.body.length
    if @message.save
      # after message is saved, update the tamagatchi
      @t = current_user.tamagatchi
      # try to feed the tamagatchi
      @result = @t.update_tamagatchi @message
      @t.save

      redirect_to tamagatchis_path, notice: @result
    else
      render 'new'
    end
  end

  def update
    @m = Message.find params[:id]
    if params[:dir]  == "upvote"
      @m.score += 1
      @m.user.tamagatchi.level += 1
      @m.user.tamagatchi.save
    elsif params[:dir] == "downvote"
      @m.score -= 1
    end
    @m.save
    redirect_to tamagatchis_path
  end

  def delete_all
    Message.destroy_all
    redirect_to tamagatchis_path
  end

  def destroy
    Message.destroy params[:id]
      redirect_to tamagatchis_path
  end

  private
    # Implement Strong Params
    def message_params
      params.require(:message).permit(:subject, :body, :is_sticky,:user_id)
    end
end
