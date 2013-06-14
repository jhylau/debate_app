class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  check_authorization :unless => :do_not_check_authorization?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def do_not_check_authorization?
    respond_to?(:devise_controller?)
  end
  
end
