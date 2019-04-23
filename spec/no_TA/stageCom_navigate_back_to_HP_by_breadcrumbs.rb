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
  scenario 'Stage.com - Navigate back to home page using breadcrumbs=' do

    visit 'https://www.stage.com/b/kids-baby-nursery-decor/N-1993scj/'

    sleep 10
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click to navigate by breadcrumps
    find(:xpath, "(//a[@class='breadcrumbs__link'])[2]").click

    #click to navigate by breadcrumps
    find(:xpath, "(//a[@class='breadcrumbs__link'])[2]").click

    #click to navigate by breadcrumps
    find(:xpath, "(//a[@class='breadcrumbs__link'])[1]").click

  end
end
end