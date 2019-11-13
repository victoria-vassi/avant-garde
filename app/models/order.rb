class Order < ApplicationRecord
  belongs_to :investment
  belongs_to :user
  belongs_to :campaign
  monetize :amount_cents
  after_create :generate_certificate

  def generate_certificate
    investment = Investment.where(campaign: self.campaign, user: self.user, amount: self.amount).first
    Certificate.create(status: investment.campaign.funded, full_name: "#{self.user.first_name} #{self.user.last_name}", investment_amount: investment.amount, campaign_name: investment.campaign.artist, campaign_image: investment.campaign.images.first.photo, campaign_title: investment.campaign.title, investment: self.investment)
  end
end
