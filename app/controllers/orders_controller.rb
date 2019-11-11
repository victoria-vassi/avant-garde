class OrdersController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign])
    @order = Order.create!(campaign: campaign, amount: campaign.investments.last.amount, user: current_user, photo: campaign.images.first.photo)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: campaign.title,
        amount: @order.amount_cents,
        images: [@order.photo],
        currency: 'usd',
        quantity: 1
      }],
      success_url: "http://127.0.0.1:3000/campaigns/#{@order.campaign_id}/investments/new",
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
