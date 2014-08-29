require 'nokogiri'
require 'open-uri'

module Lita
  module Handlers
    class Specials < Handler
      route (/^\$(specials|lunch).?/), :list_specials, help: {
        "/specials or /lunch" => "Lists the lunch specials"
      }

      def list_specials(response)
        specials = []
        specials << '```'
        specials << get_2nd_street
        specials << ''
        specials << get_squeaky_beaker
        specials << '```'

        response.reply(specials.join("\n"))
      end
      Lita.register_handler(Specials)

      def get_2nd_street
        page = Nokogiri::HTML(open('http://www.2ndstcafe.com/'))

        specials = Array.new
        specials.push("2ND STREET")

        food = page.search('#block-yui_3_10_1_1_1398362757307_5306')
        date = food.search('h1')
        specials.push(date.children.text)

        meals = food.search('p')
        specials.push(get_group_content(meals))

        soup = page.search('#block-yui_3_17_2_1_1409338497528_7786 ul li')
        specials.push(get_group_content(soup)).flatten
      end

      def get_squeaky_beaker
        page = Nokogiri::HTML(open('http://www.squeakybeaker.com/'))

        specials = Array.new
        food_soups = page.search('div.entry_content p')

        specials.push("SQUEAKY BEAKER")
        specials << food_soups.map(&:text).reject! { |ele|
          /(- \d+\.\d+ -|Soup)/ === ele
        }
        specials.flatten
      end

      def get_group_content(group)
        content = group.children.map { |ele| ele.text }
        content.reject { |text| text.blank? }.compact.flatten
      end
    end
  end
end

class String
  def blank?
    /\A[[:space:]]*\z/ === self
  end
end
