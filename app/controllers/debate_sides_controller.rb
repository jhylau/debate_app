class DebateSidesController < ApplicationController
  def update
    @debate_side = DebateSide.where(debate_id: params[:debate_id]).first
    @debate = Debate.where(id: params[:id]).first
    @debate.debate_sides.first.update_attributes(params[:debate_side])
    redirect_to debate_path(@debate)
  end

  def edit
  end
end
