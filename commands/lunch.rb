require 'date'

class Lunch < BaseCommand
  def perform
    specials = []
    specials << '```'
    specials << second_street
    specials << ''
    specials << squeaky_beaker
    specials << ''
    specials << fooda
    specials << ''
    specials << trucks
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

    soup = food.search('ul')
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

    response = "FOODA at HubSpot/Davenport\n"

    response += "#{parser.search("div.flash__message__content").text.lstrip}\n"

    vendors = parser.search("a.js-vendor-tile")
    vendors.each do |vendor|
      response += "#{vendor.search("div.myfooda-event__name").text.lstrip}"
      response += " | #{vendor.search("div.myfooda-event__cuisine").text.lstrip}\n"
      response += vendor.attributes["href"].value
      response += "\n\n"
    end

    response
  end

  def trucks
    rogers_schedule = {
      "Mon" => ["Sach Ko"],
      "Tue" => ["Chicken & Rice Guys"],
      "Wed" => ["North East of the Border"],
      "Thu" => ["Papi's Stuffed Sopapillas"]
    }

    third_schedule = {
      "Mon" => ["Gogi On The Block", "The Bacon Truck"],
      "Tue" => ["Bartleby's Seitan Stand", "Teri-Yummy"],
      "Wed" => ["Coconut Louise (Caribbean)", "Kebabish Indian Kitchen"],
      "Thu" => ["Roadies Diner", "Sa Pa Vietnamese Kitchen"],
      "Fri" => ["Rhythm 'n' Wraps", "Da Bomb"]
    }

    weekday = Date::ABBR_DAYNAMES[Date.today.wday]

    response = "SCHEDULED TRUCKS\n"
    response += "Rogers St: "

    if rogers_schedule[weekday]
      response += rogers_schedule[weekday].join(", ")
    else
      response += "None :("
    end

    response += "\n"
    response += "Third St: "

    if third_schedule[weekday]
      response += third_schedule[weekday].join(", ")
    else
      response += "None :("
    end

    response
  end

  def get_group_content(group)
    content = group.children.map(&:text)
    content.reject(&:blank?).compact.flatten
  end
end
