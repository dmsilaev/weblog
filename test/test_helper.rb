# -*- encoding : utf-8 -*-
if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start do
    add_filter "vendor/"
  end
end

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'minitest/autorun'
# require 'minitest/unit'
require 'wrong/adapters/minitest'
require 'minitest_helper'

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
  include Concerns::AuthManagment
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
