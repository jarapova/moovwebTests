require 'spec_helper'
describe 'Preconditions' do

before (:all) do
  $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone X'}
  # Capybara.current_session.driver.browser.manage.window.resize_to(320,568)
end

after (:all) do
  Capybara.current_session.driver.quit
  # Capybara.current_session.driver.browser.manage.window.resize_to(1024,640)
end

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - reaching account page from hamburger menu' do
      caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
      caps_chrome['chromeOptions'] = {'mobileEmulation' => {
        'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
        'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
      }}
      caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
      Capybara.register_driver :true_automation_driver do |app|
        TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
      end

    visit 'https://annieselke.com/'

    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta('annieselke:mainPage:hamburgerMenu')).click

    #click on category Bath in hamburger menu
    #find(:xpath, ta('annieselke:mainPage:category:bath', "//li[@class='jss40 jss257 jss260 jss265 jss264 jss266 jss269 jss69 jss270'][4]")).click
    #find(:xpath, "//li[@class='jss40 jss257 jss260 jss265 jss264 jss266 jss269 jss69 jss270'][4]").click
    find(ta('annieselke:mainPage:category:bath')).click

    #find(:xpath, ta('annieselke:mainPage:subcategory:allBath', "//a[@class='jss56 jss70'][2]")).click
    #find(:xpath, "//a[@class='jss56 jss70'][2]").click
    find(ta('annieselke:mainPage:subcategory:allBath')).click

    sleep 5
  end
end
end
