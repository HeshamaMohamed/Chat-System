redis_url = ENV.fetch('REDIS_URL')
$redis = Redis.new(url: redis_url)
