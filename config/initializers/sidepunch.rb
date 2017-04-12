require 'redis'

class sidepunch

  def intialize

    redis = Redis.new(:host => Rails.application.secrets.redis_url, :port => 6379)

  end

end
