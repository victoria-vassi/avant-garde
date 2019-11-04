class Campaign < ApplicationRecord
  belongs_to :seller
  belongs_to :renter
  has_many :images
  has_many :investments
  has_many :users, through: :investments
end
