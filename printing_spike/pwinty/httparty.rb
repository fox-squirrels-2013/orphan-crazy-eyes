# This should be some ruby that we can use to direct to run commands to get a
# payment URL for a particular pwinty order

# MerchantId : b009d259-91a4-41cf-a496-63cb53426eeb
# API Key : 2ce950c6-ce2d-4ba3-a96d-995683629afc

# Planned:
# class createOrder
# class addPhoto2Order
# class getPwintyOrderURL

require 'httparty'
require 'json'

def make_api_call_via_httparty(url)

  HTTParty.get("https://sandbox.pwinty.com/v2/Orders",
    :headers => { "X-Pwinty-MerchantId" => "b009d259-91a4-41cf-a496-63cb53426eeb", "X-Pwinty-REST-API-Key" => "2ce950c6-ce2d-4ba3-a96d-995683629afc" }
    )

  # uri = URI.parse url

  # params = { :'X-Pwinty-MerchantId' => 'b009d259-91a4-41cf-a496-63cb53426eeb', :'X-Pwinty-REST-API-Key' => '2ce950c6-ce2d-4ba3-a96d-995683629afc' }

  # http         = Net::HTTP.new(uri.host, uri.port)
  # http.use_ssl = true

  # request = Net::HTTP::Get.new uri.path

  # http.request(request)
end

# response = make_api_call "https://sandbox.pwinty.com/v2/Catalogue/US/Standard"

# catalog = JSON.parse response.body

# puts catalog

# order_response = make_api_call "https://sandbox.pwinty.com/v2/Orders"

# # # order_response = make_api_call "https://sandbox.pwinty.com/v2/Orders -H "X-Pwinty-MerchantId: b009d259-91a4-41cf-a496-63cb53426eeb" -H "X-Pwinty-REST-API-Key: 2ce950c6-ce2d-4ba3-a96d-995683629afc" -d countryCode=GB -d qualityLevel=Pro -d useTracked=true -d recipientName=Mr%20Jones -d address1=The%20Hollies -d addressTownOrCity=Cardiff -d stateOrCounty=Glamorgan -d postalOrZipCode=CF11%201AX -d payment=InvoiceRecipient"

# order_id_entire_response = JSON.parse order_response.body

# puts order_id_entire_response