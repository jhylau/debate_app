class DebateSideDecorator < Draper::Decorator
  delegate_all

  def debater
    @debater ||= model.user
  end

  def debater_name
    @debater_name ||= debater.username
  end

  def new_vote
    @new_vote ||= model.votes.create
  end

  def vote_count
    @vote_count ||= model.votes.count
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
