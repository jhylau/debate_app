class TopicsController < ApplicationController
  # check_authorization

  def create
    @category = Category.where(id: params[:category_id]).first
    @topic = @category.topics.create(params[:topic])
    @debates = Debate.all
    redirect_to '/'
  end

  def index
    @topics = Topic.all.uniq_by(&:title)
    @debate = Debate.new
  end
end
