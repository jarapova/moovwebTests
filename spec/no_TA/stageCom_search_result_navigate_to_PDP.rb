#Don't work, cause it's looks like baug




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

    sleep 10
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end
    #click on search button in top on page
    find(:xpath, "//button[@id='m-header-search']").click

    #enter search query
    find(:xpath, "//input[@id='m-search-text']").set('Signature Studio')

    sleep 1
    #click to see search results
    find(:xpath, "//a/span[text()='Signature Studio']").click
    sleep 5
  end
end
end
