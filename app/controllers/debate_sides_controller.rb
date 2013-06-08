class DebateSidesController < ApplicationController
  def update

    @debate_side = DebateSide.all.find(debate_id: "params[:debate_id]").first
    @debate = Debate.all.find(id: "params[:debate_id]").first
    @debate.debate_sides.first.update_attributes(params[:debate_side])
    redirect_to debate_path(@debate)

  end
end
