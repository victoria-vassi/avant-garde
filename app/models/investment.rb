class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :amount, presence: true

  after_save :update_funding_status

  def update_funding_status
    current_funding = campaign.price*campaign.funding_status
    current_funding += campaign.investments.last.amount
    new_funding_status = (current_funding/campaign.price).to_i
    campaign.funding_status = new_funding_status
    campaign.save!
  end
end


