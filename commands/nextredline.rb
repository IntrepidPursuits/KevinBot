require 'json'

class Nextredline < BaseCommand
  ## Note (This only responds with the first train south)
  def perform
    respond("From Kendall:
            Next redline to Ashmont comes at #{time_south_format}
            Next redline to Alewife from Ashmont comes at #{time_north_format}
            Next redline to Braintree comes at #{}")
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

  def next_south_train_to_ashmont
    Time.at(alewife_ashmont_line['direction'][0]['trip'][0]['pre_dt'].to_i)
  end

  def next_south_train_to_braintree
    Time.at(alewife_braintree_line['direction'][0]['trip'][0]['pre_dt'].to_i)
  end

  def next_north_train_from_ashmont
    Time.at(alewife_ashmont_line['direction'][1]['trip'][0]['pre_dt'].to_i)
  end

  def next_north_train_from_braintree
    Time.at(alewife_braintree_line['direction'][1]['trip'][0]['pre_dt'].to_i)
  end

  def alewife_ashmont_line
    response_body['mode'][0]['route'][0]
  end

  def alewife_braintree_line
    response_body['mode'][0]['route'][1]
  end

  def response_body
    JSON.parse(response.body)
  end

  def response
    HTTParty.get("http://realtime.mbta.com/developer/api/v2/predictionsbystop?api_key=#{ENV['MBTA_KEY']}&stop=place-knncl&format=json")
  end
end
