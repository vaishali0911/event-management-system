class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(post_params)

    @text = "Event is successfully created!"

    if @event.save
      render json: @text, status: 200, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def getEventDetails
    @eventDetails = Event.where(event_name: params[:event_name]).first
    render json:@eventDetails
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {})
    end

    def post_params
      params.require(:event).permit(:event_name, :event_description, :start_date_time, :end_date_time)
    end
end
