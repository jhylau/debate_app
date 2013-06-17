class Side
  attr_reader :side

  def initialize(debate, side)
    @side = debate.debate_sides.where(side: side).first
  end

  def debater
    @debater ||= @side.user
  end

  def debater_name
    @debater_name ||= debater.username
  end

  def new_vote
    @new_vote ||= @side.votes.create
  end
end
