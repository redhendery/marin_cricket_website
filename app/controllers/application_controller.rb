# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper, SchedulesHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'You must log in to view this page.'
      redirect_to login_url
    end
  end
end
