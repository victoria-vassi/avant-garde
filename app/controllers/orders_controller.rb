class OrdersController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign])
    @order = Order.create!(campaign: campaign, amount: campaign.price, user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: campaign.title,
        amount: @order.amount_cents / 100,
        currency: 'usd',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: session.id)
    respond_to do |format|
      format.html { redirect_to new_order_payment_path(@order) }
      format.js
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
