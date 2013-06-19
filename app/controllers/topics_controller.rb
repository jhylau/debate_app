class TopicsController < ApplicationController

  def create
    @category = Category.where(id: params[:category_id]).first
    @topic = @category.topics.new(params[:topic])
    @debates = Debate.all
    respond_to do |format|
      if @topic.save
        format.html {redirect_to root_url, notice: 'Topic was successfully created.'}
      else
        format.html {redirect_to root_url, notice: 'Topic not created. Title must be one word. Subtitle must be < 100 characters.'}
      end
    end 
  end

  def index
    @topics = Topic.all.uniq_by(&:title)
    @debate = Debate.new
  end
end
