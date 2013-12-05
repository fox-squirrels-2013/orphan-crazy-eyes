require 'spec_helper'

describe "login via instagram" do

  xit "clicking on login routes to instagram login page" do
    visit root_path
    page.has_content?("#printstacard")
    # login_with_oauth
    click_link("Connect to Instagram!")
    page.has_content?("Forgot password?")
  end

end