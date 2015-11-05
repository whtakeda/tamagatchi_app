class TamagatchiRank < ActiveRecord::Base
  has_many :tamagatchis, :foreign_key => "rank", :primary_key => "rank"
end
