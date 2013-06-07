class HomesController < ApplicationController
  def index
    @debates = Debate.all.sample(6)
  end
end
