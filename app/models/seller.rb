class Seller < ApplicationRecord
  has_one :campaigns
  validates :name, presence: true
  validates :address, presence: true
  validates :website, presence: true
end
