class EventsController < ApplicationController
  before_filter :find_event

  def index
    @order = @event.orders.build
  end

  private

    def find_event
      @event = Event.find_by_eid(params[:eid]) || Event.last
    end

end