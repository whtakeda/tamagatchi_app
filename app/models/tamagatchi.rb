class Tamagatchi < ActiveRecord::Base
  def update_tamagatchi m
      self.level +=  m.length
      # check if tamagatchi moves up a rank after updating level
      @r = TamagatchiRank.where("level <=#{self.level}").maximum(:rank)
#binding.pry
      self.rank = @r if @r > self.rank
      self.last_fed_on = DateTime.now

      return self
  end
end
