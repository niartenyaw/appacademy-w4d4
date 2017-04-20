class UsersController < ApplicationController

  def show
    @user = current_user
    if @user
      render :show
    else
      flash[:errors] = ["You don't belong here!"]
      redirect_to new_sessions_url
    end
  end

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
