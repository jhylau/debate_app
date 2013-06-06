class SignupController < ApplicationController
  def index
    @user = User.new
  end

  def show
    @user = User.new
  end
end
