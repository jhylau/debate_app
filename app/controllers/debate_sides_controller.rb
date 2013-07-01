class DebateSidesController < ApplicationController
  def update
    @debate_side = DebateSide.where(id: params[:id]).first
    @debate_side.update_attributes(params[:debate_side])
    
    @debate_side.user = current_user
    if @debate_side.save
      UserMailer.join_debate_email(current_user)
      @debate = Debate.where(id: params[:debate_id]).first
      redirect_to debate_path(@debate)
    else
      @debate = Debate.where(id: params[:debate_id]).first
      redirect_to debate_path(@debate)
    end
  end

  def edit
  end

  def index
  end
end
