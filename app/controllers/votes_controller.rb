class VotesController < ApplicationController
  def create
    @debate_side = DebateSide.find(params[:debate_side_id])
    @debate_side.votes.create(user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to debate_path(@debate_side.debate)}
      format.js
      binding.pry
    end
  end
end
