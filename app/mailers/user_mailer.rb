class UserMailer < ActionMailer::Base
  default from: "admin@debateme.com"

   def join_debate_email(user)
    @user = user
    mail(to: @user.email, subject: 'You have joined a debate')
  end
end
