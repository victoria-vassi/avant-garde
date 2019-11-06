class Campaign < ApplicationRecord
  belongs_to :seller
  belongs_to :renter
  has_many :images
  has_many :investments
  has_many :users, through: :investments
  validates :artist, presence: true
  validates :title, presence: true
  validates :year, presence: true
  validates :price, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true
  validates :minimum_investment, presence: true
  validates :category, presence: true
  validates :movement, presence: true
  validates :technique, presence: true
  validates :dimension, presence: true
  validates :description_short, presence: true
  validates :description_long, presence: true
  validates :value_increase_rate, presence: true
  validates :payout_rate, presence: true
  validates :funding_status, presence: true
  validates :funded, inclusion: { in: [true, false] }

  def new_badge?
    Date.today - self.start_date <= 14
  end
end
