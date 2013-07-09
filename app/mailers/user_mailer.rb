class UserMailer < ActionMailer::Base
  default from: "admin@debateme.com"

  def join_debate_email(user)
    @user = user
    mail(to: @user.email, subject: 'You have joined a debate')
  end

  def feedback_email(user, feedback)
    @user = user
    mail(to: 'jhylau1@gmail.com', subject: "Feedback for DebateMe", body: "hi")
  end
end
