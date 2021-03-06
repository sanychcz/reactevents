class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event
    else
      render json: @event.errors, status: :unprocessible_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    head :no_content
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessible_entity
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :date, :description, :place)
    end
end
