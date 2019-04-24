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


      # #go to stage site and click to close modal
      sleep 5
      if page.has_xpath?("//span[@class='modalClose modal-close']")
        find(:xpath, "//span[@class='modalClose modal-close']").click
      end

      #click on filter btn
      #find(:xpath, ta('stageCom:subcategoryPage:filterBtn', "//button[@class='refinements-popup-button']")).click
      #find(:xpath, "//button[@class='refinements-popup-button']").click
      find(ta(   'stageCom:subcategoryPage:filterBtn')).click
      sleep 3

      #select color filter
      #find(:xpath, ta('stageCom:subcategoryPage:filterColor', "//h4[@id='shopByTab-Color']")).click
      #find(:xpath, "//h4[@id='shopByTab-Color']").click
      find(ta(   'stageCom:subcategoryPage:filterColor')).click
      sleep 3

      if page.has_xpath?("//div[@class='acsCloseButton--container']")
        find(:xpath, "//a[@class='acsCloseButton--link acsCloseButton acsDeclineButton']").click
      end
      #select color filter
      #find(:xpath, ta('stageCom:subcategoryPage:blueColor', "//label[@for='checkbox-filter-11222']")).click
      #find(:xpath, "//label[@for='checkbox-filter-11222']").click
      find(ta(   'stageCom:subcategoryPage:blueColor')).click

      #select color filter
      #find(:xpath, ta('stageCom:subcategoryPage:applyBtn', "//input[@value='Apply']")).click
      #find(:xpath, "//input[@value='Apply']").click
      find(ta(   'stageCom:subcategoryPage:applyBtn')).click

      sleep 5
    end
  end
end
