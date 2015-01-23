require 'json'

class Nextredline < BaseCommand
  ## Note (This only responds with the first train south)
  def perform
    respond("From Kendall:
            Next redline to ashmont comes at #{time_south_format}
            Next redline to alewife from ashmont comes at #{time_north_format}")
  end

  def time_south_format
    next_south_train_to_ashmont.strftime("%H:%M")
  end

  def time_north_format
    next_train_north.strftime("%H:%M")
  end

  def next_train_north
    if next_north_train_from_braintree < next_north_train_from_ashmont
      next_north_train_from_braintree
    else
      next_north_train_from_ashmont
    end
  end

  ## This is only the alewife -> ashmont line
  def next_south_train_to_ashmont
    Time.at(response_body["mode"][0]["route"][0]["direction"][0]["trip"][0]["pre_dt"].to_i)
  end

  ## This is only the ashmont -> alewife line
  def next_north_train_from_ashmont
    Time.at(response_body["mode"][0]["route"][0]["direction"][1]["trip"][0]["pre_dt"].to_i)
  end

  def next_north_train_from_braintree
    Time.at(response_body["mode"][0]["route"][1]["direction"][1]["trip"][0]["pre_dt"].to_i)
  end

  def response_body
    JSON.parse(response.body)
  end

  def response
    HTTParty.get("http://realtime.mbta.com/developer/api/v2/predictionsbystop?api_key=#{ENV['MBTA_KEY']}&stop=place-knncl&format=json")
  end
end
