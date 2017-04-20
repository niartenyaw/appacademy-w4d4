class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render new_user_url
    end
  end

  def new; end

  def destroy
    log_out_user!
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
