# frozen_string_literal: true

# Account Activations Controller, controls user activations, helps confirm valid email address entered
class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = user.first_name + ' your account has been activated and you can now sign up for games!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
