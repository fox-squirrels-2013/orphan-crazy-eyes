require 'net/https'
require 'uri'
require 'json'

uri = URI.parse("https://sandbox.pwinty.com/v2/Orders")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
request.initialize_http_header({"X-Pwinty-MerchantId" => "b009d259-91a4-41cf-a496-63cb53426eeb", "X-Pwinty-REST-API-Key" => "2ce950c6-ce2d-4ba3-a96d-995683629afc"})

response = http.request(request)
puts response.code
puts response["location"]

# require "net/https"
# require "uri"

# uri = URI.parse("http://google.com")
# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Get.new(uri.request_uri)
# request.initialize_http_header({"User-Agent" => "My Ruby Script", "User-Agent-2" => "My Ruby other Script"})

# response = http.request(request)
# puts response.code
# # => 301
# puts response["location"] # All headers are lowercase
# # => http://www.google.com/