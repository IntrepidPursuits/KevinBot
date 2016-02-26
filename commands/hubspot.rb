class Hubspot < BaseCommand
  def perform
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

    response="```\n"

    day_of_week= parser.search("a.cal__day--active").search("div.cal__day__inner__info__label").text
    response += "Hubspot/Davenport lunch vendors for #{day_of_week}:\n"

    vendors = parser.search("a.js-vendor-tile")
    vendors.each do |vendor|
      vendor_name =vendor.search("div.myfooda-event__name").text
      vendor_cuisine =vendor.search("div.myfooda-event__cuisine").text
      vendor_url =vendor.attributes["href"].value

      response+="\n"
      response+= "#{vendor_name} (#{vendor_cuisine})\n"
      response+= "#{vendor_url}\n"
    end

    response+="```"
    respond(response)
  end
end
