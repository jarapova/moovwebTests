
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
    scenario 'Stage.com - login/logout' do

      visit 'https://www.stage.com/'

      sleep 10
      # #go to stage site and click to close modal
      expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
      # #go to stage site and click to close modal
      find(:xpath, "//span[@class='modalClose modal-close']").click

  # logIn
      #click on sandwich menu
      find(:xpath, "//button[@id='nav-button']").click

      #click to sign in in top of page
      find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click

      sleep 3

      #enter email
      find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')

      #enter password
      find(:xpath, "//input[@id='password']").set('1234tesT')

      #click Sign In to login
      find(:xpath, "//input[@value='sign in']").click

      #close modal2
      find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
  # logOUT
      #click on sandwich menu
      find(:xpath, "//button[@id='nav-button']").click

      #click Sign Out to login
      find(:xpath, "//a[@class='sign-out']").click
      sleep 5

    end
  end
end