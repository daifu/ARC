# Event controller
class EventsController < ApplicationController
  before_filter :find_event

  def index
  end

  def create_order
    order = @event.orders.build(:event_id     => params[:event_id],
                                :coupon_id    => params[:coupon_id],
                                :line_item_id => params[:line_item_id],
                                :referral_url => session[:referral_url],
                                :user_agent   => session[:user_agent])
    if order.save
      redirect_to edit_order_path(order)
    else
      flash.now[:danger] = order.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def find_event
    @event = Event.find_by_eid(params[:eid]) || Event.last
  end

end