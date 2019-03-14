require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Use search term to see search results' do
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
    caps_chrome['chromeOptions'] = {'mobileEmulation' => {
      'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
      'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    }}
    caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
    Capybara.register_driver :true_automation_driver do |app|
      TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)

    end

    visit 'https://www.stage.com/'

    sleep 2
    #go to stage site and click to close modal
    find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    #find(:xpath, ta(   'stageCom:mainPage:modalClose')).click

    #click on search button in top on page
    find(:xpath, ta('stageCom:mainPage:searchBtn', "//button[@id='m-header-search']")).click
    #find(:xpath, "//button[@id='m-header-search']").click
    #find(:xpath, ta(   'stageCom:mainPage:searchBtn')).click

    #enter search query
    find(:xpath, ta('stageCom:mainPage:searchInput', "//input[@id='m-search-text']")).set('t-shirt')
    #find(:xpath, "//input[@id='m-search-text']").set('t-shirt')
    #find(:xpath, ta(   'stageCom:mainPage:searchInput')).set('t-shirt')

    #click to see search results
    find(:xpath, ta('stageCom:mainPage:searchTerm', "//button[@class='site-search__button icon icon--search-field-default']")).click
    #find(:xpath, "//button[@class='site-search__button icon icon--search-field-default']").click
    #find(:xpath, ta(   'stageCom:mainPage:searchTerm')).click

    sleep 5
  end
end
