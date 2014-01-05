class EventsController < ApplicationController
  before_filter :find_event

  def index
  end

  private

    def find_event
      @event = Event.find_by_eid(params[:eid]) || Event.last
    end

end