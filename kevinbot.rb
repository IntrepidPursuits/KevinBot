require 'bundler/setup'
Bundler.require(:default)
require 'open-uri'
require 'httparty'

post '/' do
  puts params
end

post '/lunch' do
  puts params
  specials = []
  specials << '```'
  specials << second_street
  specials << ''
  specials << squeaky_beaker
  specials << '```'

  specials.join("\n")
  response = { body: { text: specials.join("\n") }.to_json }

  HTTParty.post('https://hooks.slack.com/services/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', response)
end

def second_street
  page = Nokogiri::HTML(open('http://www.2ndstcafe.com/'))

  specials = []
  specials.push('2ND STREET')

  food = page.search('#block-yui_3_10_1_1_1398362757307_5306')
  date = food.search('h1')
  specials.push(date.children.text)

  meals = food.search('p')
  specials.push(get_group_content(meals))

  soup = page.search('#block-yui_3_17_2_1_1409338497528_7786 ul li')
  specials.push(get_group_content(soup)).flatten
end

def squeaky_beaker
  page = Nokogiri::HTML(open('http://www.squeakybeaker.com/'))

  specials = []
  food_soups = page.search('div.entry_content p')

  specials.push('SQUEAKY BEAKER')
  specials << food_soups.map(&:text).reject! do |ele|
    /(- \d+\.\d+ -|Soup)/ === ele
  end
  specials.flatten
end

def get_group_content(group)
  content = group.children.map(&:text)
  content.reject(&:blank?).compact.flatten
end

class String
  def blank?
    /\A[[:space:]]*\z/ === self
  end
end
