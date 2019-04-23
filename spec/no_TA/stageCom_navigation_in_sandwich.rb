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

      visit 'https://www.stage.com/'

      sleep 10

      if page.has_xpath?("//span[@class='modalClose modal-close']")
        find(:xpath, "//span[@class='modalClose modal-close']").click
      end

      # click on sandwich menu
      find(:xpath, "//button[@id='nav-button']").click

      #select category
      find(:xpath, "//ul/a[@data-menu-id='Men']").click

      #select subcategory
      find(:xpath, "//a[text()='Shop All Men']").click

      #click on sandwich menu
      find(:xpath, "//button[@id='nav-button']").click

      #select category
      find(:xpath, "//ul/a[@data-menu-id='Kids']").click

      #select subcategory
      find(:xpath, "(//a[text()='Baby'])[1]").click

      #select subcategory
      find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click

      sleep 5
    end
  end
end