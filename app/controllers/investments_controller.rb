require 'openssl'

class InvestmentsController < ApplicationController

  def index
    @investments = Investment.all
  end

  def show
    @investment = Investment.find(params[:id])
  end

  def new
    @investment = Investment.new
    @campaign = Campaign.find(params[:campaign_id])
    @investments_user = Investment.where("user_id = ?", current_user.id).order("date DESC")
    @campaigns_user = Campaign.joins(:investments).where("user_id = ?", current_user.id).order("end_date DESC")
    # scale_image = @campaign.images.first.photo == "https://res.cloudinary.com/ddjh71lig/image/upload/v1572926497/Avant%20Garde/Koons1_evduwn.jpg"
    # @img_class = scale_image ? 'scale-image' : nil
    client = HelloSign::Client.new api_key: ENV['HELLOSIGN_API_KEY']
    response = client.create_embedded_signature_request(
        :test_mode => 1,
        :client_id => ENV['HELLOSIGN_CLIENT_ID'],
        :subject => 'Avant Garde Contract',
        :message => 'Please find the investment contract attached',
        :signers => [
            {
                :email_address => current_user.email,
                :name => current_user.first_name + " " + current_user.last_name
            }
        ],
        :file_url => ['http://oz.stern.nyu.edu/startups/nda2.pdf']
    )
   @response = client.get_embedded_sign_url :signature_id => response.data['signatures'][0].data['signature_id']
  end

  def create
    @investment = Investment.new(investment_params)
    @campaign = Campaign.find(params[:campaign_id])
    @user = current_user
    @investment.campaign = @campaign
    @investment.user = @user
    @investment.date = Date.today
    if @investment.save
        respond_to do |format|
      # format.html { redirect_to dashboard_path(@user) }
        format.js
        end
      else
        respond_to do |format|
        format.html { render 'campaign_path(@campaign)'}
        format.js
      end
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
