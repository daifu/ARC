# Orders controller
class OrdersController < ApplicationController
  before_filter :find_event, :only => [:new, :create]
  before_filter :find_order, :only => [:edit, :update]

  force_ssl

  # Create an order while people click the Register Now button
  #
  def update
    @order.attributes = params[:order]
    @order.user.add_dummy_email_and_password
    if @order.save
      redirect_to new_order_payment_path(@order)
    else
      flash[:notice] = @order.errors.full_messages.join('<br/>').html_safe
      render(:new)
    end
  end

  def new
  end

  def edit
    @order.user = find_user
    if @order.user.address.nil?
      @order.user.address = Address.new(:country_id => 214)
    end
    @countries = Country.all
    @states = State.all
  end

  private

  def find_order
    @order = Order.find_by_number(params[:id])
  end

  def find_event
    @event = Event.find_by_id(params[:event_id])
  end

  def find_user
    @user = current_user || User.new # create dummy user for the site
  end

end