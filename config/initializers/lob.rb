Lob.configure do |config|
  config.api_key = ENV["LOB_TEST_API_KEY"]  # get your own at http://lob.com :)
  config.api_version = "v1"        # default version
  config.protocol = "https"        # default protocol
  config.api_host = "api.lob.com"  # ofcourse it's Lob
end