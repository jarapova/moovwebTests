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
  scenario 'Annie Selke - Navigate to PDP from "No Results" page' do
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

    sleep 1

    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta('annieselke:mainPage:hamburgerMenu')).click

    #click on Search icon
    #find(:xpath, ta('annieselke:mainPage:search', "//button[@aria-label='Search']")).click
    #find(:xpath, "//button[@aria-label='Search']").click
    find(ta('annieselke:mainPage:search')).click

    #enter invalid search request
    #find(:xpath, ta('annieselke:searchPage:searchRequest', "//input")).set('84568y4thgjghd')
    #find(:xpath, "//input").set('84568y4thgjghd')
    find(ta('annieselke:searchPage:searchRequest')).set('84568y4thgjghd')

    #press on "search" button
    #find(:xpath, ta('annieselke:searchPage:searchBtn', "//form/div/div/button")).click
    #find(:xpath, "//form/div/div/button").click
    find(ta('annieselke:searchPage:searchBtn')).click

    #navigating to PDP by clicking random product image
    #find(:xpath, ta('annieselke:searchPage:product', "//img[@alt='Masinissa Hand Knotted Rug']")).click
    #find(:xpath, "//img[@alt='Masinissa Hand Knotted Rug']").click
    find(ta('annieselke:searchPage:product')).click

    sleep 5
  end
end
end
