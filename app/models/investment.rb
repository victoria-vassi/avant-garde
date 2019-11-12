class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_one :certificate
  validates :amount, presence: true
end
