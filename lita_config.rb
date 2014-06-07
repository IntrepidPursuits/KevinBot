begin
  credentials = YAML.load_file('credentials.yml')['slack']
rescue
  credentials = { 'incoming' => ENV['SLACK_INCOMING'], 'outgoing' => ENV['SLACK_OUTGOING'] }
end

Lita.configure do |config|

  if ENV['USER'].nil?
    adapter = :slack
  else
    adapter = :shell
  end

  config.robot.name = "Kevin Bot"
  config.robot.mention_name = "@kevinbot"
  config.robot.adapter = adapter
  config.adapter.password = "kevinbot"
  config.adapter.debug = false
  # config.robot.log_level = :debug
  config.http.port = 8080

  config.handlers.slack_handler.webhook_token = credentials['outgoing']
  config.handlers.slack_handler.team_domain = "intrepid"

  config.adapter.username = "kevinbot"
  config.adapter.incoming_token = credentials['incoming']
  config.adapter.team_domain = "intrepid"

  config.redis.url = ENV["REDIS_URL"]
  config.http.port = ENV["PORT"]
end
