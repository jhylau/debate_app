class VotesController < ApplicationController
  def create

    @debate_side = DebateSide.find(params[:debate_side_id])
    @vote = @debate_side.votes.create(user_id:1)
    redirect_to debate_path(@debate_side.debate)
  end
end
