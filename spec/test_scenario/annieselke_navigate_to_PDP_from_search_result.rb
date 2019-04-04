require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - Navigate to PDP from search result' do
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
    find(ta(   'annieselke:mainPage:hamburgerMenu')).click

    #click on Search icon
    #find(:xpath, ta('annieselke:mainPage:search', "//button[@aria-label='Search']")).click
    #find(:xpath, "//button[@aria-label='Search']").click
    find(ta(   'annieselke:mainPage:search')).click

    #enter valid search request
    #find(:xpath, ta('annieselke:searchPage:redColor', "//input")).set('red')
    #find(:xpath, "//input").set('red')
    find(ta(   'annieselke:searchPage:redColor')).set('red')

    #press on "search" button
    #find(:xpath, ta('annieselke:searchPage:searchBtn', "//form/div/div/button")).click
    #find(:xpath, "//form/div/div/button").click
    find(ta(   'annieselke:searchPage:searchBtn')).click

    #navigating to PDP by clicking random product image
    #find(:xpath, ta('annieselke:searchPage:productItem', "//img[@alt='Harris Crimson Micro Hooked Wool Rug']")).click
    #find(:xpath, "//img[@alt='Harris Crimson Micro Hooked Wool Rug']").click
    find(ta(   'annieselke:searchPage:productItem')).click

    sleep 5
  end
end
