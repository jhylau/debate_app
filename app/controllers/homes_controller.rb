class HomesController < ApplicationController
  def index
    @debates = Debate.all.sample(6)
    @debate = Debate.create
    @category = Category.new
    binding.pry
  end

end
