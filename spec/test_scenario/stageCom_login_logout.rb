
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
      sleep 5

      # if a modal window appears on the page, it should be closed
      #click to close modal
      if page.has_xpath?("//span[@class='modalClose modal-close']")
        find(:xpath, "//span[@class='modalClose modal-close']").click
      end
  # logIn
      #click on sandwich menu
      #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
      #find(:xpath, "//button[@id='nav-button']").click
      find(ta('stageCom:mainPage:sandwichMenu')).click

      #click to sign in in top of page
      #find(:xpath, ta('stageCom:mainPage:singIn', "//p[@class='m-menu__account__links']/a[text()='Sign in']")).click
      #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
      find(ta('stageCom:mainPage:singIn')).click

      sleep 3

  #enter email
      #find(:xpath, ta('stageCom:loginPage:accountEmail', "//input[@id='email']")).set('julia.arapova@softesis.com')
      #find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')
      find(ta('stageCom:loginPage:accountEmail')).set('julia.arapova@softesis.com')

      #enter password
      #find(:xpath, ta('stageCom:loginPage:accountPassword', "//input[@id='password']")).set('1234tesT')
      #find(:xpath, "//input[@id='password']").set('1234tesT')
      find(ta('stageCom:loginPage:accountPassword')).set('1234tesT')

      #click Sign In to login
      #find(:xpath, ta('stageCom:loginPage:signIn', "//input[@value='sign in']")).click
      #find(:xpath, "//input[@value='sign in']").click
      find(ta('stageCom:loginPage:signIn')).click

      # close modal2
      if page.has_xpath?("//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']")
        find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
      end
  # logOUT
      #click on sandwich menu
      #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
      #find(:xpath, "//button[@id='nav-button']").click
      find(ta('stageCom:mainPage:sandwichMenu')).click

      #click Sign Out to login
      #find(:xpath, ta('stageCom:loginPage:signOut', "//a[@class='sign-out']")).click
      #find(:xpath, "//a[@class='sign-out']").click
      find(ta('stageCom:loginPage:signOut')).click
      sleep 5

    end
  end
end
