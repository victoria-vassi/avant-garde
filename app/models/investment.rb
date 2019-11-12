class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  validates :amount, presence: true
  validates :status, default: false
end


