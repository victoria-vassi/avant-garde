class Order < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  belongs_to :investment
  monetize :amount_cents
  after_create :generate_certificate

  def generate_certificate
    investment = Investment.where(campaign: self.campaign, user: self.user, amount:  self.amount).first
    Certificate.create(full_name: "#{self.user.first_name}", investment_amount: investment.amount, campaign_name: investment.campaign.artist, campaign_image: investment.campaign.images.first.photo, campaign_title: investment.campaign.title, investment: self.investment)
  end
end
