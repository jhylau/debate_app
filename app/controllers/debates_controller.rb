class DebatesController < ApplicationController
  def show
    @debate_page = DebatePage.new(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @debate_page }
    end
  end

  def index
    @debates = Debate.debate_search(params[:query])
  end

  def create
    @debate = Debate.create(topic_id: params[:topic_id])
    @debate_side_yes = @debate.debate_sides.create(side:'yes')
    @debate_side_no = @debate.debate_sides.create(side:'no')
    redirect_to debate_path(@debate)
  end

end
