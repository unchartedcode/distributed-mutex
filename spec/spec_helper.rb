$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'redis'
require 'mock_redis'
require 'distributed_mutex'
require 'coveralls'
Coveralls.wear!

$redis = MockRedis.new
