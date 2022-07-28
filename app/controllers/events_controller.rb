class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :admin_user, only: %i[ create new edit update destroy ]

  # GET /events
  def index
    @events = Event.where("date>=?", Date.today).sort_by &:date
  end

  # GET /events/1
  def show; end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      @event.new_event_email
      redirect_to @event
      flash[:success] = 'Event was successfully created and you emailed the whole club about it'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event
      flash[:success] = 'Event was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    @event.event_cancelled_email
    redirect_to events_url 
    flash[:danger] = 'Event was deleted and you emailed the Club to tell them.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:date, :start_time, :end_time, :title, :location, :about)
    end

    def admin_user
      redirect_to events_url unless admin_logged_in?
    end
end
