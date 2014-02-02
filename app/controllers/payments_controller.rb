class PaymentsController < ApplicationController
  before_filter :find_order

  def new
    @payment = @order.payments.paypal.build
  end

  def show
  end

  def create
    payment = @order.payments.paypal.create!(params[:payment])
    
    payment.setup!(
      success_payments_url,
      cancel_payments_url
    )
    if payment.popup?
      redirect_to payment.popup_uri
    else
      redirect_to payment.redirect_uri
    end
  end

  private

  def find_order
    @order = Order.find_by_number(params[:order_id])
    render_404 unless @order
  end
end