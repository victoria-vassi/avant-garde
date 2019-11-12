class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :amount, presence: true

  def update_after_paid
    current_funding = campaign.price*campaign.funding_status/100
    current_funding += amount
    new_funding_status = (current_funding.to_f/campaign.price.to_f*100).to_i
    campaign.funding_status = new_funding_status
    if new_funding_status >= 100
      campaign.funded = true
      campaign.funding_status = 100
    end
    campaign.save!
  end
end
