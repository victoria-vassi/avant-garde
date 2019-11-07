class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :amount, presence: true

  after_save :update_campaign

  def update_campaign
  campaign.investments.each do |element|
    sum = 0
    sum += element.amount
  end
  campaign.funding_status = (sum/campaign.price*100).round
  campaign.save
  end
end
