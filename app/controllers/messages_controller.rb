class MessageController < ApplicationController
  belongs_to :user
  def index
    @messages = Message.all.order(id: :desc)
  end
end
