class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'paid').find(params[:order_id])
    @certificate = current_user.orders.where(state: 'paid').find(params[:order_id])
  end
end
