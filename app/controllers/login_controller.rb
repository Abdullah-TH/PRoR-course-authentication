class LoginController < ApplicationController
  def new
    if session[:user_id]
      redirect_to dashboard_index_url
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(email: user_params[:email], password: user_params[:password])
    if @user
      flash[:notice] = "You are logged in!"
      session[:user_id] = @user.id
      redirect_to dashboard_index_url
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
