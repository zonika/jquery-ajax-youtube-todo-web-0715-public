ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

Yt.configure do |config|
  config.log_level = :debug
end

require 'dotenv'
Dotenv.load

require './lib/youtube.rb'
require './app'
