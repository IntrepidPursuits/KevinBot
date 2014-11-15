require 'bundler/setup'
require 'dotenv'
require 'open-uri'

Bundler.require(:default)
Dotenv.load

Dir['commands/**/*.rb'].each { |f| load f }

post '/' do
  puts params
end

post '/command' do
  command_class.perform
  200
end

def command_class
  class_name = params[:command].gsub('/', '')
  Kernel.const_get(class_name.capitalize)
end
