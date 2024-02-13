
class EventsController < ApplicationController
  def create
    EventCreator.new(params).call
    redirect_to events_path, notice: 'Event created successfully!'
  end
end
