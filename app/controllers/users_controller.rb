# frozen_string_literal: true

# Users Controller, controls User and Admin User actions
class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  before_action :logged_in_user, only: %i[edit update destroy]
  before_action :set_user, only: %i[show edit update destroy make_admin remove_admin
                                    paid not_paid activate_account deactivate_account]
  before_action :admin_user, only: %i[make_admin remove_admin paid not_paid
                                          activate_account deactivate_account]

  def index
    if admin_logged_in?
      @users = User.all
    else
      @users = User.where(activated: true).order(first_name: :asc)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if verify_recaptcha(model: @user)
      if @user.save && admin_logged_in?
        @user.update(activated: true)
        flash[:success] =
        "You have created and activated a user with the name #{@user.first_name} #{@user.last_name}"
        redirect_to @user
      elsif @user.save
        @user.send_activation_email
        flash[:info] = 'Please check your email to activate your account.
        The email may take several minutes to come through,
        be sure to check your spam folder as well.'
        redirect_to root_url
      else
        render 'new'
      end
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "#{@user.first_name} your profile was successfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to users_url
    flash[:danger] = "User #{@user.first_name} #{@user.last_name} has been deleted."
  end

  def make_admin
    @user.update(admin: true)
    redirect_to users_url
    flash[:success] = "User #{@user.first_name} #{@user.last_name} now has admin rights."
  end

  def remove_admin
    @user.update(admin: false)
    redirect_to users_url
    flash[:danger] = "User #{@user.first_name} #{@user.last_name} no longer has admin rights."
  end

  def paid
    @user.update(paid: true)
    redirect_to users_url
    flash[:success] = "User #{@user.first_name} #{@user.last_name} now has paid their fees."
  end

  def not_paid
    @user.update(paid: false)
    redirect_to users_url
    flash[:danger] = "User #{@user.first_name} #{@user.last_name} has not paid their fees."
  end

  def activate_account
    @user.update(activated: true)
    redirect_to users_url
    flash[:success] = "User #{@user.first_name} #{@user.last_name} now has been activated and will receive game emails."
  end

  def deactivate_account
    @user.update(activated: false)
    redirect_to users_url
    flash[:danger] = "User #{@user.first_name} #{@user.last_name} now has been deactivated and will no longer receive game emails."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :role, :bats, :bowls, :profile)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def correct_user
    @user = User.friendly.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || admin_logged_in?
  end

  def admin_user
    redirect_to root_url unless admin_logged_in?
  end

end
