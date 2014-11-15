require 'bundler/setup'
require 'dotenv'
require 'open-uri'

Bundler.require(:default)
Dotenv.load

require './base_command'
Dir['commands/**/*.rb'].each { |f| load f }

post '/' do
  if ENV['LOG'] == 'true'
    puts params
  end

  begin
    command_class.perform(params)
    200
  rescue
    [404, "Sorry, kevinbot doesn't have a command called #{params[:command]}"]
  end
end

def command_class
  class_name = params[:command].gsub('/', '')
  Kernel.const_get(class_name.capitalize)
end
