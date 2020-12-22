# frozen_string_literal: true

# Sessions Controller, controls user login and session tokens
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = 'Please activate your account. '
        message += 'This email can take 10 minutes to arrive, be sure to check your spam folder as well.'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Please check your email address and password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
