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
  scenario 'Stage.com - Check email subscription' do
   visit 'https://www.stage.com/'

    sleep 10

   if page.has_xpath?("//span[@class='modalClose modal-close']")
     find(:xpath, "//span[@class='modalClose modal-close']").click
   end

    #click on sandwich menu
    find(:xpath, "//button[@id='nav-button']").click

    #click to sign up in top of page
    find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click

    # close modal2
   if page.has_xpath?("//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']")
     find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
   end

    #click on logo img
    find(:xpath, "//p[@class='footer__title-text']/a").click

    #enter first name
    find(:xpath, "//input[@id='register-first-name']").set('someName')

    #enter last name
    find(:xpath, "//input[@id='register-last-name']").set('lastNAme')

    #enter email
    find(:xpath, "//input[@id='register-email']").set('example@gmail.com')

    #enter phone
    find(:xpath, "//input[@id='register-phone']").set('+780956749323')

    #click signUp to complete
    find(:xpath, "//input[@value='Sign Up']").click
    sleep 5
  end
end
end