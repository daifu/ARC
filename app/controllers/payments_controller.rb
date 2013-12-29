class PaymentsController < ApplicationController
  before_filter :find_order

  def new
    @payment = @order.payments.build
  end

  def create
  end

  private

  def find_order
    @order = Order.find_by_number(params[:id])
    render_404 unless @order
  end
end