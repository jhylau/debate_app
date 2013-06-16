class ParticipateController < ApplicationController
  
  def index
    @debates = Debate.all
    @debates_with_one_participant = only_one_participant(@debates)
  end

  private
  def only_one_participant(debates)
    debates.where(:
  end

  end
end
