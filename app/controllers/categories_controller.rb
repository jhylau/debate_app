class CategoriesController < ApplicationController
  def new
    @category = Category.first
    authorize! :read, @category
    @topic = @category.topics.build
  end
end
