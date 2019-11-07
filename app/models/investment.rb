class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :amount, presence: true

  after_save :update_fstatus

  def update_fstatus
  sum = 0
  campaign.investments.each do |element|
    sum += element.amount
  end
  campaign.funding_status = (sum/campaign.price*100).round
  campaign.save
  end
end
