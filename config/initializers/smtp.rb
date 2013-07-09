# if Rails.env.development?
#   #mail catcher
#   ActionMailer::Base.delivery_method = :smtp
#   ActionMailer::Base.smtp_settings = {
#     address: 'localhost',
#     port: 1025
#   }
# else
  ActionMailer::Base.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "debunkme.org",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["GMAIL_USER_NAME"],
    password: ENV["GMAIL_PASSWORD"]
  }
# end
