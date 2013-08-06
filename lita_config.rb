# Email: edward+kb@edwardloveall.com
# Pass: kevinbot

Lita.configure do |config|
  config.robot.name = "Kevin Bot"
  config.robot.adapter = :hipchat
  config.adapter.jid = "59616_409420@chat.hipchat.com"
  config.adapter.password = "kevinbot"
  config.adapter.debug = true
  config.adapter.rooms = :all
  config.adapter.muc_domain = "conf.hipchat.com"
  config.redis.url = ENV["REDIS_URL"]
  config.http.port = ENV["PORT"]
end
