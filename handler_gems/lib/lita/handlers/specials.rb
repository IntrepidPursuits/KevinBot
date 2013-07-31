require 'nokogiri'
require 'open-uri'

module Lita
  module Handlers
    class Hello < Handler
      route (/^specials?/), :list_specials, command: true, help: {
        "specials" => "Lists the food specials"
      }
      
      def list_specials(response)
        secondStDoc = Nokogiri::HTML(open('http://www.2ndstcafe.com/'))
        secondStreetSpecials = secondStDoc.search('#entree-specials ul li').map { |x| x.content }
        secondStreetSpecials.unshift("***2nd Street***")

        specials = secondStreetSpecials
        
        response.reply('These are the specials:', specials)
      end
    end
    Lita.register_handler(Hello)
  end
end
