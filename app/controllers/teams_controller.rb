class TeamsController < ApplicationController
  before_action :set_team, only: %w[show edit update destroy]
  before_action :admin_user, only: %w[create new edit update destroy]

  def index
    if admin_logged_in?
      @pagy, @teams = pagy(Team.all, items: 10)
    else
      @teams = Team.where(id: [1, 3, 39])
    end
  end

  def show; end

  def edit; end

  def update
    if @team.update(team_params)
      flash[:success] = 'Team successfully updated!'
      redirect_to @team
    else
      render 'edit'
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url
    flash[:danger] = @team.name + ' has been deleted.'
  end

  private

    def team_params
      params.require(:team).permit(:name, :about, :home_field, :abbreviation)
    end

    def set_team
      @team = Team.friendly.find(params[:id])
    end

    def admin_user
      redirect_to teams_url unless admin_logged_in?
    end
end
