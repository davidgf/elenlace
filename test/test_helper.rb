ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'clearance/test_unit'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  # require 'clearance/testing/deny_access_matcher'

  def set_current_attendee(type)
    attendee = FactoryGirl.create(type)
    cookies[:auth_token] = attendee.auth_token
    return attendee
  end

  def ensure_not_authenticated
    cookies.delete(:auth_token)
  end

  # Add more helper methods to be used by all tests here...
end
