class DebateSideDecorator < Draper::Decorator
  delegate_all

  def debater
    @debater ||= model.user
  end

  def debater_name
    @debater_name ||= debater.username
  end

  def vote_count
    @vote_count ||= model.votes.count
  end

  def opposing_argument
    @opposing_argument ||= model.debate.debate_sides.where('side != ?',model.side).first.argument
  end

  def opposing_rebuttal
    @opposing_rebuttal ||= model.debate.debate_sides.where('side != ?',model.side).first.rebuttal
  end

end
