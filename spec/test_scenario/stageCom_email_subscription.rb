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

    # #go to stage site and click to close modal
     sleep 5
     if page.has_xpath?("//span[@class='modalClose modal-close']")
       find(:xpath, "//span[@class='modalClose modal-close']").click
     end

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta(   'stageCom:mainPage:sandwichMenu')).click

    #click to sign up in top of page
    #find(:xpath, ta('stageCom:mainPage:singUp', "//p[@class='m-menu__account__links']/a[text()='Sign up']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(ta(   'stageCom:mainPage:singUp')).click

    # close modal2
   if page.has_xpath?("//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']")
     find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
   end

    #click on logo img
    #find(:xpath, ta('stageCom:mainPage:subscriptionLink', "//p[@class='footer__title-text']/a")).click
    #find(:xpath, "//p[@class='footer__title-text']/a").click
    find(ta(   'stageCom:mainPage:subscriptionLink')).click

    #enter first name
    #find(:xpath, ta('stageCom:accountPage:subscriptionFirstName', "//input[@id='register-first-name']")).set('someName')
    #find(:xpath, "//input[@id='register-first-name']")).set('someName')
    find(ta(   'stageCom:accountPage:subscriptionFirstName')).set('example@gmail.com')

    #enter last name
    #find(:xpath, ta('stageCom:accountPage:subscriptionLastName', "//input[@id='register-last-name']")).set('lastNAme')
    #find(:xpath, "//input[@id='register-last-name']").set('lastNAme')
    find(ta(   'stageCom:accountPage:subscriptionLastName')).set('lastNAme')

    #enter email
    #find(:xpath, ta('stageCom:accountPage:subscriptionEmail', "//input[@id='register-email']")).set('example@gmail.com')
    #find(:xpath, "//input[@id='register-email']").set('example@gmail.com')
    find(ta(   'stageCom:accountPage:subscriptionEmail')).set('example@gmail.com')

    #enter phone
    #find(:xpath, ta('stageCom:accountPage:subscriptionphone', "//input[@id='register-phone']")).set('+780956749323')
    #find(:xpath, "//input[@id='register-phone']").set('+780956749323')
    find(ta(   'stageCom:accountPage:subscriptionphone')).set('+780956749323')

    #click signUp to complete
    #find(:xpath, ta('stageCom:loginPage:signUp', "//input[@value='Sign Up']")).click
    #find(:xpath, "//input[@value='Sign Up']").click
    find(ta(   'stageCom:loginPage:signUp')).click
    sleep 5
  end
end
end