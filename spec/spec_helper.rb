require 'simplecov'

SimpleCov.start
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  include AuthHelper
  include InstagramStub
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # config.include IntegrationSpecHelper
  Capybara.default_host = 'http://example.org'

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
    credentials: {
      token: "cheeseburger"
    },
    info: {
      nickname: "miya"
    },
    access_token: "fb2e77d.47a0479900504cb3ab4a1f626d174d2d",
    user: {
        id: "1574083",
        username: "snoopdogg",
        full_name: "Snoop Dogg",
        profile_picture: "http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg"
    }
  })
end
