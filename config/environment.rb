require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'dotenv'
Dotenv.load

ENV['SINATRA_ENV'] ||= "development"

require 'rubygems'
require 'google/api_client'
require 'trollop'
require 'youtube_it'

require './app'
require_all 'lib'