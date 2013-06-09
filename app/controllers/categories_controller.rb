class CategoriesController < ApplicationController
  def new
    @category = Category.all.first
    @topic = @category.topics.build
    @debate = Debate.all
  end
end
