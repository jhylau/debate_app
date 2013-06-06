class HomesController < ApplicationController
  def index
  end

  helper method :debates

  protected
  def debates
    @debates ||= Debate.all.sample(6)
  end
end
