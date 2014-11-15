require 'bundler/setup'
require 'dotenv'
require 'open-uri'

Bundler.require(:default)
Dotenv.load

require './base_command'
Dir['commands/**/*.rb'].each { |f| load f }

post '/' do
  command_class.perform(params)
  200
end

def command_class
  class_name = params[:command].gsub('/', '')
  Kernel.const_get(class_name.capitalize)
end
