class TopicsController < ApplicationController
  def create
    @category = Category.where(id: params[:category_id]).first
    @topic = @category.topics.build(params[:topic])
    @debates = Debate.all
    redirect_to '/'
  end

  def index

  end
end
