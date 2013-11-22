class OrdersController < ApplicationController
  before_filter :find_event, :only   => [:create]
  before_filter :find_order, :except => [:create]

  force_ssl

  # Create an order while people click the Register Now button
  #
  def create
    @order = Order.new
    @order.user = @user
    @order.event = @event
    if @order.save
      redirect_to edit_order_url(@order)
    else
      render show_event_url
    end
  end

  def edit
    @order.user = find_user
    @order.user.address = Address.new if @order.user.address.nil?
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def find_event
    @event = Event.find_by_eid(params[:event_id])
  end

  def find_user
    @user = current_user || User.new # create dummy user for the site
  end

end