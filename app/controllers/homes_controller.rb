class HomesController < ApplicationController
  def index
    @debates = []
    6.times do
      @debates << Debate.where("id in (select debate_id from debate_sides)").first
    end
    @debate = Debate.create
    @category = Category.new
  end

end
