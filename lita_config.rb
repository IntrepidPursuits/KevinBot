# Email: edward+kb@edwardloveall.com
# Pass: kevinbot

Lita.configure do |config|

  if ENV['USERNAME'].nil?
    adapter = :shell
  else
    adapter = :hipchat
  end

  config.robot.name = "Kevin Bot"
  config.robot.adapter = adapter
  config.adapter.jid = "15467_415912@chat.hipchat.com"
  config.adapter.password = "kevinbot"
  config.adapter.debug = false
  # config.adapter.rooms = :all
  config.adapter.rooms = ["15467_trivial_pursuits"]
  config.adapter.muc_domain = "conf.hipchat.com"
  config.redis.url = ENV["REDIS_URL"]
  config.http.port = ENV["PORT"]
end
