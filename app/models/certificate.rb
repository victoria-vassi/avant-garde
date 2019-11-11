class Certificate < ApplicationRecord
  has_many :certificate_items, dependent: :destroy
  belongs_to :investment

  STATUS_CLASS = {
    :open => "badge badge-success",
    :closed => "badge badge-secondary"
  }

  def status_class
    STATUS_CLASS[self.status]
  end
end
