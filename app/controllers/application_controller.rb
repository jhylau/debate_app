class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def show
    @user = current_user
  end
end
