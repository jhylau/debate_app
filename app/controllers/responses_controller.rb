class ResponsesController < ApplicationController

  def create
    @debate_side = DebateSide.where(id: params[:debate_side_id]).first
    @response = @debate_side.responses.create(params[:response])
    redirect_to debate_path(@debate_side.debate)

  end

end
