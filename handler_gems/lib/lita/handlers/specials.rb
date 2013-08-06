require 'nokogiri'
require 'open-uri'

module Lita
  module Handlers
    class Specials < Handler
      route (/^\/(specials|lunch).?/), :list_specials, help: {
        "specials" => "Lists the lunch specials"
      }

      def list_specials(response)
        specials = get_2nd_street
        specials.push('')
        specials += get_squeaky_beaker

        response.reply(specials.join("\n"))
      end
      Lita.register_handler(Specials)

      def get_2nd_street
        separator = "=========================="
        secondStDoc = Nokogiri::HTML(open('http://www.2ndstcafe.com/'))

        specials = Array.new
        specials.push(separator)
        specials.push("2ND STREET")
        specials.push(separator)

        specials.push(secondStDoc.search('#entree-specials ul li').map { |e| e.content })

        specials.push("2ND STREET SOUPS")
        specials.push(secondStDoc.search('#soup-specials ul li').map { |e| e.content })
      end

      def get_squeaky_beaker
        separator = "=========================="
        squeakyDoc = Nokogiri::HTML(open('http://www.squeakybeaker.com/'))

        specials = Array.new
        specials.push(separator)
        specials.push("SQUEAKY BEAKER")
        specials.push(separator)

        specialsDOM = squeakyDoc.search('div.entry_content p')

        soupIndex = nil
        specialsDOM.each_with_index do |e, i|
          if e.content.match('Soups:')
            soupIndex = i
          end
        end

        specialsDOM[soupIndex].content = "SQUEAKY BEAKER SOUPS"
        specials.push(specialsDOM.map { |e| e.content })
      end
    end
  end
end
