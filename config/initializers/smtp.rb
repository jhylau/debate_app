if Rails.env.development?
  #mail catcher
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'localhost',
    port: 1025
  }
else
  ActionMailer::Base.smtp_settings = {
    authentication: :plain,
    address: "smtp.sendgrid.net",
    port: 25,
    domain:'',
    user_name:'',
    password:'',
    perform_deliveries: true
  }
end
