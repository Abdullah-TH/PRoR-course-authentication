class DashboardController < ApplicationController
  def index
    unless session[:user_id]
      flash[:notice] = "You have to log in first"
      redirect_to new_login_path
    end
  end
end
