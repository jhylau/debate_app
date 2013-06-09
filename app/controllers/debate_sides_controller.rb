class DebateSidesController < ApplicationController
  def update
    @debate_side = DebateSide.where(id: params[:id]).first
    @debate = Debate.where(id: params[:debate_id]).first
       binding.pry
    @debate.debate_sides.where(id: params[:id]).first.update_attributes(params[:debate_side])
    redirect_to debate_path(@debate)
  end

  def edit
  end
end
