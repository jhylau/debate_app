class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      UserMailer.feedback_email(current_user)
      redirect_to about_index_path, notice: "Thanks for feedback!"
    else
      redirect_to debate_path(@debate)
    end
  end
end
