class Certificate < ApplicationRecord
  has_many :certificate_items, dependent: :destroy
  belongs_to :investment

  STATUS_CLASS = {
    :open => "badge badge-success",
    :closed => "badge badge-secondary"
  }

  # def subtotal
  #   self.invoice_items.map { |item| item.qty * item.price }.sum
  # end

  # def discount_calculated
  #   subtotal * (self.discount / 100.0)
  # end

  # def vat_calculated
  #   (subtotal - discount_calculated) * (self.vat / 100.0)
  # end

  # def total
  #   subtotal - discount_calculated + vat_calculated
  # end

  def status_class
    STATUS_CLASS[self.status]
  end
end
