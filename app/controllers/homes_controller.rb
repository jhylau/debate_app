class HomesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @debates = Debate.all.sample(6)
    @debate = Debate.create
    @category = Category.new
  end
end
