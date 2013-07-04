class AboutController < ApplicationController
  def index
    @feedback = Feedback.new
  end
end
