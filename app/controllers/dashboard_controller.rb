class DashboardController < ApplicationController
  def index
    unless session[:user_id]
      redirect_to new_login_path
    end
  end
end
