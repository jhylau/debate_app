class DebatesController < ApplicationController
  def show
    @debate = Debate.find(params[:id])
    @debate_side_yes = @debate.debate_sides.where(side:'yes').last
    @debate_side_no = @debate.debate_sides.where(side:'no').last
    binding.pry
  end

  def index
  end

  def new
    @debate = Debate.create(topic_id: params[:topic])
    @debate_side_yes = @debate.debate_sides.create(side:'yes')
    @debate_side_no = @debate.debate_sides.create(side:'no')
    redirect_to debate_path(@debate)
  end

end
