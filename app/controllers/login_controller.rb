class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email], password: user_params[:password])
    if @user
      flash[:notice] = "You are logged in!"
      render :new, status: :unprocessable_entity
    else
      flash[:notice] = "Wrong email or password"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
