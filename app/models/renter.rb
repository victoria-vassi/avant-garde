class Renter < ApplicationRecord
  belongs_to :campaign
  validates :name, presence: true
  validates :address, presence: true
  validates :website, presence: true
end
