require 'nokogiri'
require 'open-uri'

module Lita
  module Handlers
    class Specials < Handler
      route (/^\/(specials|lunch).?/), :list_specials, help: {
        "/specials or /lunch" => "Lists the lunch specials"
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

        specialDom = secondStDoc.search('div#block-yui_3_10_1_1_1398362757307_5306 ul')
        specials.push(break_apart_ul(specialDom[0]))

        specials.push("2ND STREET SOUPS")
        specials.push(break_apart_ul(specialDom[1]))
      end

      def get_squeaky_beaker
        separator = "=========================="
        squeakyDoc = Nokogiri::HTML(open('http://www.squeakybeaker.com/'))

        specialsDOM = squeakyDoc.search('div.entry_content h4')
        soupsDOM = squeakyDoc.search('div.entry_content p')

        specials = Array.new
        specials.push(separator)
        specials.push("SQUEAKY BEAKER")
        specials.push(separator)
        specials.push(specialsDOM[specialsDOM.length - 1].content)

        specials.push("SQUEAKY BEAKER SOUPS")
        soupsDOM.shift
        specials.push(soupsDOM.map { |e| e.content })
      end

      def break_apart_ul(dom)
        dom.search('li').map { |e| e.content }
      end
    end
  end
end
