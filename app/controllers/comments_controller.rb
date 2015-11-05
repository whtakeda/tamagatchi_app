class CommentsController < ApplicationController
  def new
  end

  def index
  end

  def create
    @comment = Message.find(params[:comment][:message_id].to_i).comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to tamagatchis_path
    end
  end

  private
    # Implement Strong Params
    def comment_params
      params.require(:comment).permit(:body, :user_id, :message_id)
    end
end
