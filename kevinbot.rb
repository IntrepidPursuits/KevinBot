require 'bundler/setup'
require 'dotenv'
require 'open-uri'

Bundler.require(:default)
Dotenv.load

require './base_command'
Dir['commands/**/*.rb'].each { |f| load f }

# this line is needed to resolve the conflict between Sinatra and Mechanize
set :server, 'webrick'

post '/' do
  puts params if log?

  begin
    puts command_response if log?
    command_response

    200
  rescue StandardError => e
    message = "Sorry, kevinbot doesn't have a command called #{params[:command]}"
    puts e.message if log?

    [404, message]
  end
end

def command_response
  @command_response ||= command_class.perform(params)
end

def command_class
  class_name = command.gsub('/', '')
  Kernel.const_get(class_name.classify)
end

def command
  params[:command] || ''
end

def log?
  ENV['LOG'] == 'true'
end
