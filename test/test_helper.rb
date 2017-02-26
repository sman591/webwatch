ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new(
    extra: {
      raw_info: {
        user_metadata: {
          admin: true
        }
      }
    }
  )

  def login
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:auth0]
    get auth_auth0_callback_url
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :minitest
      with.library :rails
    end
  end
end
