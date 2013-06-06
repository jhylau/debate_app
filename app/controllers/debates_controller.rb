class DebatesController < ApplicationController
  def show
    @debate = Debate.new
  end
  def index
  end
end
