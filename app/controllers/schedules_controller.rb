class SchedulesController < ApplicationController
  before_action :upcoming, :previous, only: :index
  before_action :mno_schedule, only: %w[index ones]
  before_action :mnt_schedule, only: %w[index twos]
  before_action :mns_schedule, only: %w[index socials]
  before_action :admin_user, only: %w[create new edit destroy]
  before_action :set_schedule, only: %w[show edit update destroy]

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

  private

    def schedule_params
      params.require(:schedule).permit(:date, :home_team_id, :away_team_id)
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
      s = Schedule.includes(:home_team, :away_team)
      mns = s.where(home_team_id: 3) + s.where(away_team_id: 3)
      @mns = mns.sort_by &:date
    end
end
