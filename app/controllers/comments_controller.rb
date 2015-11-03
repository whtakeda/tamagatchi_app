class CommentsController < ApplicationController
  def new
  end

  def index
  end

  def create
#    binding.pry
    @comment = Comment.new(comment_params)
    @comment.message_id = current_user.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to tamagatchis_path
    end
  end

  private
    # Implement Strong Params
    def comment_params
#      binding.pry
      params.require(:comment).permit(:body, :user_id, :message_id)
    end
end
