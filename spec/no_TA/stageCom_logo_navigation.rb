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
    scenario 'Stage.com - navigation to subcategory in hamburger menu' do

      visit 'https://www.stage.com/b/men-clothing-jeans/N-1ug3rz1/'

      sleep 10

        if page.has_xpath?("//span[@class='modalClose modal-close']")
          find(:xpath, "//span[@class='modalClose modal-close']").click
        end
      # # #go to stage site and click to close modal
      # expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
      # # #go to stage site and click to close modal
      # find(:xpath, "//span[@class='modalClose modal-close']").click

      #click on logo img
      find(:xpath, "//a[@class='m-header__logo']").click

      sleep 5
    end
  end
end