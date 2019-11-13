class Review < ApplicationRecord
  belongs_to :campaign
  has_one :answer, dependent: :destroy
end
