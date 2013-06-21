class ResponsesController < ApplicationController

  def create
    @debate_side = DebateSide.where(id: params[:debate_side_id]).first
    @response = @debate_side.new_response

    if @response.update_attributes(params[:response])
      redirect_to debate_path(@debate_side.debate), notice: 'successfully submitted response.'
    else  
      redirect_to debate_path(@debate_side.debate), notice: 'failed to submit.'
    end

  end

end
