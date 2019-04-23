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
    scenario 'Stage.com - Create account' do

      visit 'https://www.stage.com/'

      sleep 10
      # #go to stage site and click to close modal
      expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
      # #go to stage site and click to close modal
      find(:xpath, "//span[@class='modalClose modal-close']").click

      #click on sandwich menu
      find(:xpath, "//button[@id='nav-button']").click

      #click to sign up in top of page
      find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click

      #enter first name
      find(:xpath, "//input[@id='first-name']").set('yourName')

      #enter last name
      find(:xpath, "//input[@id='last-name']").set('yourLastName')

      #enter email
      find(:xpath, "//input[@id='email-address']").set('email')

      #enter password
      find(:xpath, "//input[@id='set-password']").set('1234tesT')

      #confirm password
      find(:xpath, "//input[@id='confirm-password']").set('1234tesT')

      #click signUp to complete registration
      find(:xpath, "//input[@value='Sign Up']").click

      sleep 15
    end
  end
end