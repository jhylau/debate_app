class VotesController < ApplicationController
  def create
    @debate_side = DebateSide.find(params[:debate_side_id])
    @new_vote = @debate_side.votes.new
    @new_vote.user_id = current_user.id
    respond_to do |format|
      if @new_vote.save
        format.html { redirect_to debate_path(@debate_side.debate) }
        format.json
      else
        format.json
      end
    end
  end
end
