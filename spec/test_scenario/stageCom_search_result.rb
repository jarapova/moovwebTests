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
  scenario 'Stage.com - Use search term to see search results' do

    visit 'https://www.stage.com/'

    sleep 5
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click on search button in top on page
    #find(:xpath, ta('stageCom:mainPage:searchBtn', "//button[@id='m-header-search']")).click
    #find(:xpath, "//button[@id='m-header-search']").click
    find( ta(   'stageCom:mainPage:searchBtn')).click

    sleep 5
    #enter search query
    #find(:xpath, ta('stageCom:mainPage:searchInput', "//input[@id='m-search-text']")).set('t-shirt')
    #find(:xpath, "//input[@id='m-search-text']").set('t-shirt')
    find(ta(   'stageCom:mainPage:searchInput')).set('t-shirt')

    #click to see search results
    #find(:xpath, ta('stageCom:mainPage:searchTerm', "//button[@class='site-search__button icon icon--search-field-default']")).click
    #find(:xpath, "//button[@class='site-search__button icon icon--search-field-default']").click
    find(ta(   'stageCom:mainPage:searchTerm')).click

    sleep 5
  end
end
end
