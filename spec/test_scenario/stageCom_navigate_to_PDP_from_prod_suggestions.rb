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

      sleep 5
      if page.has_xpath?("//span[@class='modalClose modal-close']")
        find(:xpath, "//span[@class='modalClose modal-close']").click
      end

      #click on sandwich menu
      #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
      #find(:xpath, "//button[@id='nav-button']").click
      find(ta(   'stageCom:mainPage:sandwichMenu')).click

      #click to select deals
      find(:xpath, ta('stageCom:mainPage:todaysDeals', "//ul/a[1]")).click
      #find(:xpath, "//ul/a[1]").click
      #find(ta(   'stageCom:mainPage:todaysDeals')).click

      #choose deals
      find(:xpath, ta('stageCom:prodPage:deals', "(//div[@class='shopnow-btn']/div/a)[1]")).click
      #find(:xpath, "(//div[@class='shopnow-btn']/div/a)[1]").click
      #find(ta(   'stageCom:prodPage:deals')).click

      #choose deals category (second^ woomen's clearance)
      #find(:xpath, ta('stageCom:prodPage:dealsCategory', "(//a[@class='product-image'])[2]")).click
      #find(:xpath, "(//a[@class='product-image'])[2]").click
      find(ta(   'stageCom:prodPage:dealsCategory')).click

      #choose deals prodact - Rebecca Malone Women's Basic Knit T-shirt
      #find(:xpath, ta('stageCom:prodPage:dealsProduct', "(//a[@class='catalog-item__title'])[4]")).click
      #find(:xpath, "(//div[@class='catalog-item__price-labels'])[4]").click
      find(ta(   'stageCom:prodPage:dealsProduct')).click

      sleep 15
    end
  end
end