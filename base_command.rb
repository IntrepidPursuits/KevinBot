require 'httparty'

class BaseCommand
  attr :params

  include HTTParty
  SLACK_HOOK_URL = ENV.fetch('SLACK_HOOK_URL', '')

  def initialize(params)
    @params = params
  end

  def self.perform(params)
    new(params).perform
  end

  def respond(body)
    if slack?
      self.class.post(SLACK_HOOK_URL, response)
    else
      response(body)
    end
  end

  def response(body)
    {
      body: {
        text: body,
        channel: channel
      }.to_json
    }
  end

  def channel
    if channel_name
      "##{channel_name}"
    else
      '#trivial-pursuits'
    end
  end

  def channel_name
    @params[:channel_name]
  end

  def slack?
    SLACK_HOOK_URL != ''
  end
end

class String
  def blank?
    /\A[[:space:]]*\z/ === self
  end

  def present?
    !blank?
  end
end
