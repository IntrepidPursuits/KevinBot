require 'HTTParty'

class BaseCommand
  include HTTParty
  SLACK_HOOK_URL = ENV.fetch('SLACK_HOOK_URL')

  def respond(body)
    response = { body: { text: body }.to_json }
    self.class.post(SLACK_HOOK_URL, response)
  end
end
