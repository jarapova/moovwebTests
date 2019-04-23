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
    scenario 'Stage.com - add item to cart' do

      visit 'https://www.stage.com/'

      sleep 10
      if page.has_xpath?("//span[@class='modalClose modal-close']")
        find(:xpath, "//span[@class='modalClose modal-close']").click
      end
      # logIn
      #click on sandwich menu
      find(:xpath, "//button[@id='nav-button']").click
      #click to sign in in top of page
      find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
      #enter email
      sleep 3
      find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')
      #enter password
      find(:xpath, "//input[@id='password']").set('1234tesT')
      #click Sign In to login
      find(:xpath, "//input[@value='sign in']").click

      # close modal2
      if page.has_xpath?("//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']")
        find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
      end

      #click on logo img
      find(:xpath, "//a[@class='m-header__logo']").click
      # open minicart
      find(:xpath, "//a[@class='m-header__minicart m-header__miniCartInnerContent']").click
      sleep 5
    end
  end

end
