class DebatesController < ApplicationController
  def show
    @debate = Debate.find(params[:id])
    @debate_page = DebatePage.new(@debate)
    @debate_side_yes = @debate.debate_sides.where(side:'yes').last
    @debate_side_no = @debate.debate_sides.where(side:'no').last
    @user_yes = @debate_side_yes.user
    @user_no = @debate_side_no.user
    @vote_yes = @debate_side_yes.votes.new
    @vote_no = @debate_side_no.votes.new
  end

  def index
    @debates = Debate.all
  end

  def create
    @debate = Debate.create(topic_id: params[:topic_id])
    @debate_side_yes = @debate.debate_sides.create(side:'yes')
    @debate_side_no = @debate.debate_sides.create(side:'no')
    redirect_to debate_path(@debate)
  end

end
