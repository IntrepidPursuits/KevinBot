class Lunch < BaseCommand
  def perform
    specials = []
    specials << '```'
    specials << second_street
    specials << ''
    specials << squeaky_beaker
    specials << ''
    specials << fooda
    specials << '```'

    respond specials.join("\n")
  end

  private

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
      /(- \d+\.\d+ -|Soup)/ === ele || ele.blank?
    end
    specials.flatten
  end

  def fooda
    agent = Mechanize.new
    page = agent.get('https://app.fooda.com/login')

    # login
    form = agent.page.forms.first
    fooda_email = ENV['FOODA_EMAIL']
    fooda_password = ENV['FOODA_PASSWORD']
    if !fooda_email || !fooda_password
      puts "Please specify fooda email and password in .env file"
      return
    end
    form.fields[2].value = fooda_email
    form.fields[3].value = fooda_password
    page = form.submit

    parser = page.parser

    response = "FOODA\n"

    page.links_with(:text => /Lunch at/).each do |link|
      agent.get(link.href)
      response += "*#{link.text.split(",")[0]}*\n\n"

      vendors = agent.page.parser.search("a.js-vendor-tile")
      vendors.each do |vendor|
        response += "#{vendor.search("div.myfooda-event__name").text.lstrip}"
        response += " | #{vendor.search("div.myfooda-event__cuisine").text.lstrip}\n"
        response += vendor.attributes["href"].value
        response += "\n\n"
      end
    end
    response
  end

  def get_group_content(group)
    content = group.children.map(&:text)
    content.reject(&:blank?).compact.flatten
  end
end
