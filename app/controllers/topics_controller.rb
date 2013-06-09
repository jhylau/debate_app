class TopicsController < ApplicationController
  def create
    @category = Category.where(id: params[:category_id]).first
    @topic = @category.topics.build(params[:topic])
    @debates = Debate.all
    redirect_to '/'
  end

  def index
    @topic = Topic.all.sample(1).first
    @debate = Debate.create(topic_id:@topic.id)
  end
end
