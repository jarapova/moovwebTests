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
    scenario 'Stage.com - Navigate to PDP from product suggestions' do

      visit 'https://www.stage.com/'

      sleep 10

      if page.has_xpath?("//span[@class='modalClose modal-close']")
        find(:xpath, "//span[@class='modalClose modal-close']").click
      end

      #click on sandwich menu
      find(:xpath, "//button[@id='nav-button']").click

      #click to select deals
      find(:xpath, "//ul/a[1]").click

      #choose deals
      find(:xpath, "(//div[@class='shopnow-btn']/div/a)[2]").click

      #choose deals category (second^ woomen's clearance)
      find(:xpath, "(//a[@class='product-image'])[2]").click

      # #choose deals prodact - Rebecca Malone Women's Basic Knit T-shirt
      # find(:xpath, "(//div[@class='catalog-item__price-labels'])[4]").click

      sleep 15
    end
  end
end