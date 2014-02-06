# Payment controller
class PaymentsController < ApplicationController
  rescue_from Payment::PaymentError, :with => :payment_error

  before_filter :find_order

  def new
    @payment = @order.payments.paypal.build
  end

  def show
  end

  def create
    payment = params[:payment][:type].constantize.create!(params[:payment])
    @order.payments << payment
    payment.capture(
      success_order_payments_url,
      cancel_order_payments_url
    )
    redirect_to payment.txns.last.popup_uri
  end

  def cancel
    handle_callback do |payment|
      payment.void
      flash.now[:notice] = 'Payment Request Canceled'
    end
  end

  private

  def find_order
    @order = Order.find_by_number(params[:order_id])
    render_404 unless @order
  end

  def payment_error(msg)
    redirect_to root_url, :error => msg
  end

  def handle_callback
    payment = @order.payments.last
    yield payment
    render :close_flow, layout: false
  end
end