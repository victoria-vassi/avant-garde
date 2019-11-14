class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    campaign = order.campaign
    investment = order.investment
    current_funding = campaign.price*campaign.funding_status/100
    current_funding += investment.amount
    new_funding_status = (current_funding.to_f/campaign.price.to_f*100).to_i
    campaign.funding_status = new_funding_status
    investment.status = true
    if new_funding_status >= 100
      campaign.funded = true
      campaign.funding_status = 100
    end
    campaign.save!
    Certificate.create(status: investment.campaign.funded, full_name: "#{order.user.first_name} #{order.user.last_name}", investment_amount: investment.amount, campaign_name: investment.campaign.artist, campaign_image: investment.campaign.images.first.photo, campaign_title: investment.campaign.title, investment: order.investment)
  end
end
