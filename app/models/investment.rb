class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_one :certificate
  has_one :order
  validates :amount, presence: true
end
