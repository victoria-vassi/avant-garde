class Order < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  monetize :amount_cents
end
