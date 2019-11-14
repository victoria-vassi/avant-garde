class Certificate < ApplicationRecord
  has_many :certificate_items, dependent: :destroy
  belongs_to :investment

  after_create :send_pdf_email

  private

  def send_pdf_email
    UserMailer.with(user: self.investment.user, certificate: self).pdf.deliver_now
  end
end
