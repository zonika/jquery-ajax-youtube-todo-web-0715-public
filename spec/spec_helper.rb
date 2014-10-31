ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'

require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara-webkit'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end

RSpec::Matchers.define :match_exactly do |expected_match_count, selector|
  match do |context|
    matching = context.all(selector)
    @matched = matching.size
    @matched == expected_match_count
  end
  failure_message do
    "expected '#{selector}' to match exactly #{expected_match_count} elements, but matched #{@matched}"
  end
  failure_message_when_negated do
    "expected '#{selector}' to NOT match exactly #{expected_match_count} elements, but it did"
  end
end

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.javascript_driver = :webkit
Capybara.app = app
