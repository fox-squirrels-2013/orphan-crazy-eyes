require 'spec_helper'

describe "login via instagram" do
  it "clicking on login routes to instagram login page" do
    visit root_path
    page.has_content?("#collect_a_matron")
    # login_with_oauth
    click_link("Connect to Instagram!")
    page.has_content?("Forgot password?")
  end

  it "clicking on login routes to instagram login page" do
    visit root_path
    page.has_content?("#collect_a_matron")
    click_link("AOL you know for kids!")
    page.has_content?("WELCOME, SIGN IN")
  end
end