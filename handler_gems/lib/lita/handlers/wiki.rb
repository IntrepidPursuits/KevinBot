require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'json'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module Lita
  module Handlers
    class IntrepidWiki < Handler
      route (/^\$(wiki|hr).?/), :list_documents, help: {
        "/wiki" => "Lists wiki documents"
      }

      def list_documents(response)

        username = ENV['BASECAMP_USERNAME']
        password = ENV['BASECAMP_PASSWORD']

        data = JSON.parse(open('https://basecamp.com/2384773/api/v1/projects/3783080/documents.json',
                    'User-Agent' => 'KevinBot (matt@intrepid.io)',
                    :http_basic_authentication => [username, password]).read)
        pages = Array.new

        data.each { |e|
          response.reply(e['title'] + '  https://basecamp.com/2384773/projects/3783080/documents/' + e['id'].to_s)
        }
      end
      Lita.register_handler(IntrepidWiki)
    end
  end
end
