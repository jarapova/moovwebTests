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

    sleep 5
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(:xpath, ta(   'stageCom:mainPage:sandwichMenu')).click

    #click to sign up in top of page
    #find(:xpath, ta('stageCom:mainPage:singUp', "//p[@class='m-menu__account__links']/a[text()='Sign up']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(ta(   'stageCom:mainPage:singUp')).click

    #enter first name
    #find(:xpath, ta('stageCom:loginPage:firstName', "//input[@id='first-name']")).set('yourName')
    #find(:xpath, "//input[@id='first-name']").set('yourName')
    find(ta(   'stageCom:loginPage:firstName')).set('yourName')

    #enter last name
    #find(:xpath, ta('stageCom:loginPage:lastName', "//input[@id='last-name']")).set('yourLastName')
    #find(:xpath, "//input[@id='last-name']")..set('yourLastName')
    find(ta(   'stageCom:loginPage:lastName')).set('yourLastName')

    #enter email
    #find(:xpath, ta('stageCom:loginPage:email', "//input[@id='email-address']")).set('email')
    #find(:xpath, "//input[@id='email-address']").set('email')
    find(ta(   'stageCom:loginPage:email')).set('email')

    #enter password
    #find(:xpath, ta('stageCom:loginPage:password', "//input[@id='set-password']")).set('1234tesT')
    #find(:xpath, "//input[@id='set-password']").set('1234tesT')
    find(ta(   'stageCom:loginPage:password')).set('1234tesT')

    #confirm password
    #find(:xpath, ta('stageCom:loginPage:confirmPassword', "//input[@id='confirm-password']")).set('1234tesT')
    #find(:xpath, "//input[@id='confirm-password']").set('1234tesT')
    find( ta(   'stageCom:loginPage:confirmPassword')).set('1234tesT')

    #click signUp to complete registration
    #find(:xpath, ta('stageCom:loginPage:signUp', "//input[@value='Sign Up']")).click
    #find(:xpath, "//input[@value='Sign Up']").click
    find(ta(   'stageCom:loginPage:signUp')).click

    sleep 15
  end
end
end
