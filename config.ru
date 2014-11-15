require 'rubygems'
require 'bundler'
Bundler.require(:default)

require './kevinbot'
run Sinatra::Application
