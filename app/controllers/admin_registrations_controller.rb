class AdminRegistrationsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    User.create!(email: params[:email], password: params[:password], role: :admin)
    redirect_to root_path
  end
end
