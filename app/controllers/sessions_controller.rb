class SessionsController < ApplicationController
  def new
    redirect_to home_path if current_user
  end

  def create
    user = User.where(email: params[:email]).first #can use find_by in Rails 4
    if user && user.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        flash[:warning] = "You are signed in, enjoy!"
        redirect_to home_path
      else
        flash[:danger] = "Your account has been suspended, please contact customer service."
        redirect_to sign_in_path
      end
    else
      flash[:danger] = "Invalid email or password."
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:warning] = "You are signed out."
    redirect_to root_path
  end
end