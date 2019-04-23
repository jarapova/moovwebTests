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
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta(   'stageCom:mainPage:sandwichMenu')).click

    #click to sign in in top of page
    #find(:xpath, ta('stageCom:mainPage:singIn', "//p[@class='m-menu__account__links']/a[text()='Sign in']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(ta(   'stageCom:mainPage:singIn')).click

    sleep 3

    #enter email
    #find(:xpath, ta('stageCom:loginPage:accountEmail', "//input[@id='email']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')
    find(ta(   'stageCom:loginPage:accountEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('stageCom:loginPage:accountPassword', "//input[@id='password']")).set('1234tesT')
    #find(:xpath, "//input[@id='password']").set('1234tesT')
    find( ta(   'stageCom:loginPage:accountPassword')).set('1234tesT')

    #click Sign In to login
    #find(:xpath, ta('stageCom:loginPage:signIn', "//input[@value='sign in']")).click
    #find(:xpath, "//input[@value='sign in']").click
    find(ta(   'stageCom:loginPage:signIn')).click

    # close modal2
    if page.has_xpath?("//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']")
      find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
    end

    #click on logo img
    #find(:xpath, ta('stageCom:mainPage:logo', "//a[@class='m-header__logo']")).click
    #find(:xpath, "//a[@class='m-header__logo']").click
    find(ta(   'stageCom:mainPage:logo')).click

    # open minicart
    #find(:xpath, ta('stageCom:mainPage:minicart', "//a[@class='m-header__minicart m-header__miniCartInnerContent']")).click
    #find(:xpath, "//a[@class='m-header__minicart m-header__miniCartInnerContent']").click
    find(ta(   'stageCom:mainPage:minicart')).click

    sleep 5
  end
end

end
