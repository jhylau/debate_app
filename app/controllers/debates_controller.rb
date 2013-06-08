class DebatesController < ApplicationController
  def show
    @debate = Debate.find(params[:id])
    @debate_side = @debate.debate_sides.first
  end

  def index
  end

end
