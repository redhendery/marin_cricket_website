# frozen_string_literal: true

# Users Controller, controls User and Admin User actions
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.order(first_name: :asc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Thank you for signing up to the Marin Cricket Club!'
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def show; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
