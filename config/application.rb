require_relative 'boot'

config.action_mailer.delivery_method = :postmark
config.action_mailer.postmark_settings = { :api_token => "076e44a6-d0f5-41f1-b3c9-147b8c439386" }

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AvantGarde
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
  end
end
