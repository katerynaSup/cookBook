class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user
      if @user.password == params[:password_hash]
        session[:user_id] = @user.id
        redirect_to @user
      end
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to '/login'
  end
end
