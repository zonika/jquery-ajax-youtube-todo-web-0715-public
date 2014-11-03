ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'dotenv'
Dotenv.load

require 'json'
require './lib/youtube.rb'
require './app'