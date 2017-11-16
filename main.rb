require File.expand_path('../boot', __FILE__)
require_relative 'gocn_spider'
result = GocnSpider.scheduler
puts result