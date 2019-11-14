require 'openssl' unless defined?(OpenSSL)

class HelloSignWebhooksController < ApplicationController
  class InvalidSignature < StandardError; end

  before_action :parse_params
  before_action :check_event_hash!

  def create
    # TODO: implement your logic with what you received in `params[:event]`
    render text: 'Hello API Event Received'
  end

  private

  def check_event_hash!
    message = "#{params[:event][:event_time]}#{params[:event][:event_type]}"
    expected_hash = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA256.new, ENV['HELLOSIGN_API_KEY'], message)
    unless ActiveSupport::SecurityUtils.secure_compare(params[:event][:event_hash], expected_hash)
      fail InvalidSignature
    end
  end

  def parse_params
    params.merge! JSON.parse(params[:json])
    params.delete :json
  end
end
