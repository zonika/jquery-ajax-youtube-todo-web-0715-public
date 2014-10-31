ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'

require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  DatabaseCleaner.strategy = :truncation
  config.before do
    DatabaseCleaner.clean
  end
  config.after do
    DatabaseCleaner.clean
  end
end

RSpec::Matchers.define :match_exactly do |expected_match_count, selector|
  match do |context|
    matching = context.all(selector)
    @matched = matching.size
    @matched == expected_match_count
  end

  failure_message_for_should do
    "expected '#{selector}' to match exactly #{expected_match_count} elements, but matched #{@matched}"
  end

  failure_message_for_should_not do
    "expected '#{selector}' to NOT match exactly #{expected_match_count} elements, but it did"
  end
end


def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app