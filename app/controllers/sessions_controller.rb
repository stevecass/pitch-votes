class SessionsController < ApplicationController
  def create
    oa = env["omniauth.auth"]
    info = oa["info"]
    user = User.from_auth(info)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out"
  end

end