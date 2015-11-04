class Tamagatchi < ActiveRecord::Base
  def update_tamagatchi m
      @i = DateTime.now.to_i - self.last_fed_on.to_i
      if  @i.between?(0,3599)
        @msg = "Your TamaGAtchi is still full from its previous meal and can't eat anymore right now."
      elsif @i.between?(3600,14399)
        self.level += m.length
        @msg = ""
      else
        self.level += m.length/2
        @msg = "It's been too long since you last fed your TamaGAtchi.  It only eats half the meal before throwing up."
      end
      # check if tamagatchi moves up a rank after updating level
      @r = TamagatchiRank.where("level <=#{self.level}").maximum(:rank)

      self.rank = @r if @r > self.rank
      self.last_fed_on = DateTime.now

      return @msg
  end
end
