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

  def response_count
    @response_count ||= model.responses.count
  end
  
  def opposition_response_count
    @opposition_response_count ||= model.debate.debate_sides.where('side != ?',model.side).first.responses.count
  end

end
