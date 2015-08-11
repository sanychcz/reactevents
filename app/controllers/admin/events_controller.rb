class Admin::EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			redirect_to admin_root_path
		else
			render 'new'
		end
	end

  def edit
		@event = Event.find(params[:id])
	end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to admin_root_path
  end

  def update
  	@event = Event.find(params[:id])
  	if @event.update(event_params)
  		redirect_to admin_root_path
  	else
  		render 'edit'
  	end
  end

	private

		def event_params
			params.require(:event).permit(:title, :date, :description, :place)
		end
end