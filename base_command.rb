require 'httparty'
require 'active_support/all'

class BaseCommand
  attr :params

  include HTTParty
  SLACK_HOOK_URL = ENV.fetch('SLACK_HOOK_URL', '')

  def initialize(params = {})
    @params = params
  end

  def self.perform(params = {})
    new(params).perform
  end

  def respond(text)
    if slack?
      self.class.post(SLACK_HOOK_URL, response(text))
    else
      response(text)
    end
  end

  def standard_body(text)
    {
      text: text,
      channel: channel
    }
  end

  def body(text)
    result = standard_body(text)

    if username.present? && icon_url.present?
      result.merge(username: username, icon_url: icon_url)
    elsif username.present?
      result.merge(username: username)
    elsif icon_url.present?
      result.merge(icon_url: icon_url)
    else
      result
    end
  end

  def response(text)
    {
      body: body(text).to_json
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

  def username
    ''
  end

  def icon_url
    ''
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
