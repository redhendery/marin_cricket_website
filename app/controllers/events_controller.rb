class EventsController < ApplicationController
  before_action :set_event, only: %w[show edit update destroy]
  before_action :admin_user, only: %w[create new edit update destroy]
  
  def index
    @events = Event.where("date>=?", Date.today).sort_by &:date
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @event.update(event_params)
      flash[:success] = 'Event successfully updated!'
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url
    flash[:danger] = @event.name + ' has been deleted.'
  end

  private

    def event_params
      params.require(:event).permit(:about, :date, :end_time, :location, :start_time, :title)
    end

    def set_event
      @event = Event.friendly.find(params[:id])
    end

    def admin_user
      if admin_logged_in?
      else redirect_to events_url
      end
    end

end
