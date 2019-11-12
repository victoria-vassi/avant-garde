class Certificate < ApplicationRecord
  has_many :certificate_items, dependent: :destroy
  belongs_to :investment
end
