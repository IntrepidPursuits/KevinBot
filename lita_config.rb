# Email: edward+kb@edwardloveall.com
# Pass: kevinbot

Lita.configure do |config|
  config.robot.name = "Kevin Bot"
  config.robot.adapter = :hipchat
  # config.adapter.jid = "59616_409420@chat.hipchat.com" # development
  config.adapter.jid = "15467_415912@chat.hipchat.com" # production
  config.adapter.password = "kevinbot"
  config.adapter.debug = false
  config.adapter.rooms = ["15467_trivial_pursuits"]
  config.adapter.muc_domain = "conf.hipchat.com"
  config.redis.url = ENV["REDIS_URL"]
  config.http.port = ENV["PORT"]
end
