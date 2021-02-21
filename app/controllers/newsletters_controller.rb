# frozen_string_literal: true

class NewslettersController < ApplicationController
  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @user = User.find_by(email: @newsletter.email)
      redirect_to root_url
      flash[:info] = "#{@user.first_name} you already receive these emails because you have a member account."
    elsif @newsletter.save
      redirect_to root_url
      flash[:success] = "Thank you #{@newsletter.first_name} for signing up to the game notifications newsletter."
    else
      render 'new'
    end
  end

  def destroy
    @newsletter = Newsletter.find_by(email: params[:email].downcase)
    if @newsletter
      @newsletter.destroy
      redirect_to root_url
      flash[:warning] = "#{@newsletter.first_name}, you have been removed from
                          the mailing list and will not longer receive these emails."
    else
      flash.now[:warning] = 'Email address not found. Please check and try again.'
      render 'remove'
    end
  end

  def remove; end

  private

  def newsletter_params
    params.require(:newsletter).permit(:first_name, :last_name, :email)
  end
end
