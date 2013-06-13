class CategoriesController < ApplicationController

  def new
    @category = Category.all.first
    authorize! :read, @category
    @topic = @category.topics.build
    # @debate = Debate.all
  end
end
