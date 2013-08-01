require 'nokogiri'
require 'open-uri'

module Lita
  module Handlers
    class Hello < Handler
      route (/^specials?/), :list_specials, command: true, help: {
        "specials" => "Lists the food specials"
      }

      def list_specials(response)
        specials = get_2nd_street
        specials += get_squeaky_beaker

        response.reply('These are the specials:', specials.join("\n"))
      end
      Lita.register_handler(Hello)

      def get_2nd_street
        secondStDoc = Nokogiri::HTML(open('http://www.2ndstcafe.com/'))
        specials = secondStDoc.search('#entree-specials ul li').map { |e| e.content }
        specials.unshift("***2nd Street***")
      end

      def get_squeaky_beaker
        squeakyDoc = Nokogiri::HTML(open('http://www.squeakybeaker.com/'))
        specials = squeakyDoc.search('div.entry_content p')

        soupIndex = nil;
        specials.each_with_index do |e, i|
          if e.content.match('Soups:')
            soupIndex = i
          end
        end

        specials[soupIndex].content = "***Squeaky Beaker Soups***"
        specials = specials.map { |e| e.content }
        specials.unshift("***Squeaky Beaker Specials***")
      end
    end
  end
end
