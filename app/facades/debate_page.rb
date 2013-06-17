class DebatePage
  attr_reader :debate

  def initialize(params)
    @debate = Debate.find(params)
  end

  def yes_side
    @yes_side ||= @debate.debate_sides.where(side:"yes").first.decorate
  end

  def no_side
   @no_side ||= @debate.debate_sides.where(side:"no").first.decorate
  end

end
