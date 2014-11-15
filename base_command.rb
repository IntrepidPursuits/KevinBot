require 'httparty'

class BaseCommand
  attr :params

  include HTTParty
  SLACK_HOOK_URL = ENV.fetch('SLACK_HOOK_URL')

  def initialize(params)
    @params = params
  end

  def respond(body)
    response = {
      body: {
        text: body,
        channel: channel
      }.to_json
    }
    self.class.post(SLACK_HOOK_URL, response)
  end

  def channel
    if @params[:channel_name].present?
      "##{@params[:channel_name]}"
    else
      '#trivial-pursuits'
    end
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
