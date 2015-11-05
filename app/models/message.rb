class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
end
