require 'bundler/setup'
require 'dotenv'
require 'open-uri'

Bundler.require(:default)
Dotenv.load

require './base_command'
Dir['commands/**/*.rb'].each { |f| puts f; load f }

post '/' do
  if log?
    puts params
  end

  begin
    command_class.perform(params)
    200
  rescue StandardError => e
    message = "Sorry, kevinbot doesn't have a command called #{params[:command]}"

    if log?
      puts message
      puts e.message
    end

    [404, message]
  end
end

def command_class
  puts command
  class_name = command.gsub('/', '')
  Kernel.const_get(class_name.capitalize)
end

def command
  params[:command] || ''
end

def log?
  ENV['LOG'] == 'true'
end
