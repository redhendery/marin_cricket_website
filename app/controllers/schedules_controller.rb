class SchedulesController < ApplicationController
  before_action :upcoming, :previous, only: :index
  before_action :mno_schedule, only: %i[index ones]
  before_action :mnt_schedule, only: %i[index twos]
  before_action :mns_schedule, only: %i[index socials]
  before_action :admin_user, only: %i[create new edit destroy]
  before_action :logged_in_user, only: %i[game_signup game_withdrawal]
  before_action :set_schedule, only: %i[show edit update destroy game_signup game_withdrawal selection]

  def index
    @mno_next = @upcoming.where(home_team_id: 1).or(@upcoming.where(away_team_id: 1))
    @mno_last = @previous.where(home_team_id: 1).or(@previous.where(away_team_id: 1))
    @mnt_next = @upcoming.where(home_team_id: 2).or(@upcoming.where(away_team_id: 2))
    @mnt_last = @previous.where(home_team_id: 2).or(@previous.where(away_team_id: 2))
    @mns_next = @upcoming.where(home_team_id: 3).or(@upcoming.where(away_team_id: 3))
    @mns_last = @previous.where(home_team_id: 3).or(@previous.where(away_team_id: 3))
  end

  def show; end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to @schedule
    else
      render 'new'
    end
  end

  def update
    if @schedule.update(schedule_params)
      flash[:success] = 'Game Successfully Updated!'
      redirect_to @schedule
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    @schedule.destroy
    redirect_to schedules_url
    flash[:danger] = 'Game has been deleted'
  end

  def ones; end

  def twos; end

  def socials; end

  def game_signup
    @selection = Selection.find_by(schedule_id: @schedule.id, user_id: current_user.id)
    if @selection
      flash[:info] = current_user.first_name +
                      ", as amazing as it would be to have two of you in the team,
                      I'm pretty sure that you aren't Michael Keaton and this isn't Multiplicity."
      redirect_to @schedule
    else
      current_user.selections.create(schedule: @schedule)
      @schedule.send_game_sign_up_email current_user
      flash[:success] = 'Thank you for signing up to play ' + current_user.first_name + '!'
      redirect_to @schedule
    end
  end

  def game_withdrawal
    @selection = Selection.find_by(schedule_id: @schedule.id, user_id: current_user.id)
    if @selection
      @selection.destroy
      @schedule.send_game_withdrawal_email current_user
      flash[:danger] = current_user.first_name +
                      ', you have been removed from the selection pool.'
      redirect_to @schedule
    else
      flash[:info] = current_user.first_name + ", you are already weren't signed up to play. So rest assured we won't pick you."
      redirect_to @schedule
    end
  end

  def selection
    @selections = @schedule.selections.includes(:schedule)
  end

  private

    def schedule_params
      params.require(:schedule).permit(:date, :home_team_id,
                      :away_team_id, :start_time, user_ids: [])
    end

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def admin_user
      if admin_logged_in?
      else redirect_to schedules_url
      end
    end

    def upcoming
      @upcoming = Schedule.where(date: next_week)
    end

    def previous
      @previous = Schedule.where(date: last_week).where.not(date: Date.today)
    end

    def mno_schedule
      s = Schedule.includes(:home_team, :away_team)
      mno = s.where(home_team_id: 1) + s.where(away_team_id: 1)
      @mno = mno.sort_by &:date
    end

    def mnt_schedule
      s = Schedule.includes(:home_team, :away_team)
      mnt = s.where(home_team_id: 2) + s.where(away_team_id: 2)
      @mnt = mnt.sort_by &:date
    end

    def mns_schedule
      mns = Schedule.includes(:home_team, :away_team).where(teams: { name: 'Marin Socials' })
      @mns = mns.sort_by &:date
    end
end
