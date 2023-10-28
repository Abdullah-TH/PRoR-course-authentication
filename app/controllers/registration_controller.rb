class RegistrationController < ApplicationController
  def new
    if session[:user_id]
      redirect_to dashboard_index_url
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "user created"
      redirect_to new_login_path
    else
      flash[:notice] = "something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
