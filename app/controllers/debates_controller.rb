class DebatesController < ApplicationController
  def show
    @debate_page = DebatePage.new(params[:id])
  end

  def index
    @debates = Debate.sample(20)
  end

  def create
    @debate = Debate.create(topic_id: params[:topic_id])
    @debate_side_yes = @debate.debate_sides.create(side:'yes')
    @debate_side_no = @debate.debate_sides.create(side:'no')
    redirect_to debate_path(@debate)
  end

end
