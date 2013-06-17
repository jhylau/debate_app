class ParticipateController < ApplicationController
  
  def index
    @debates = Debate.all
  end

end
