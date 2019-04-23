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
    scenario 'Stage.com - Apply filter to see filtered results' do

      visit 'https://www.stage.com/b/juniors-clothing-tops/N-wr35dq/'

      sleep 10
      #go to stage site and click to close modal
       expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
      # #go to stage site and click to close modal
      find(:xpath, "//span[@class='modalClose modal-close']").click

      #click on filter btn
      find(:xpath, "//button[@class='refinements-popup-button']").click
      sleep 3
      #select color filter
      find(:xpath, "//h4[@id='shopByTab-Color']").click
      sleep 3

      #select color filter
      find(:xpath, "//label[@for='checkbox-filter-11222']").click

      #select color filter
      find(:xpath, "//input[@value='Apply']").click

      sleep 5
    end
  end
end