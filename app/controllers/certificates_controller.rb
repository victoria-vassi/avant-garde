class CertificatesController < ApplicationController
  def index
    @certificates = scope
  end

  def create
    @certificate = current_user.certificate.build(certificate_params)

    if @certificate.save
      mail = UserMailer.with(certificate: @certificate).create_confirmation
      mail.deliver_now
      redirect_to certificate_path(@certificate)
    else
      render :new
    end
  end

  def show
    @certificate = scope.find(params[:id])
    respond_to do |format|
      format.html { render 'see_certificate'}
      format.pdf do
        render pdf: "Certificate No. #{@certificate.id}",
        page_size: 'A4',
        template: "certificates/show.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

private
  def scope
    ::Certificate.all.includes(:certificate_items)
  end
end
