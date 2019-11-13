class OrdersController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign])
    @order = Order.create!(campaign: campaign, investment: campaign.investments.last, amount: campaign.investments.last.amount, user: current_user, photo: campaign.images.first.photo)
    if Rails.env == "production"
      success_url = "https://avant-garde-investments.herokuapp.com/orders/#{@order.id}/payments/new"
    else
      success_url = "http://127.0.0.1:3000/orders/#{@order.id}/payments/new"
    end
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: campaign.title,
        amount: @order.amount_cents,
        images: [@order.photo],
        currency: 'usd',
        quantity: 1
      }],

      success_url: success_url,
      cancel_url: order_url(@order)
    )
    @order.update(checkout_session_id: session.id)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
