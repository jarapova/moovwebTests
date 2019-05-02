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
  scenario 'Stage.com - Edit account' do
    visit 'https://www.stage.com/'
    sleep 5

    # if a modal window appears on the page, it should be closed
    #click to close modal
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta('stageCom:mainPage:sandwichMenu')).click

    #click to sign in in top of page
    #find(:xpath, ta('stageCom:mainPage:singIn', "//p[@class='m-menu__account__links']/a[text()='Sign in']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(ta('stageCom:mainPage:singIn')).click

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

    sleep 3
    #click to select preference in dropdown
    #find(:xpath, ta('stageCom:accountPage:settingsDropdown', "//select[@id='account-nav-select']")).select('Profile & Preferences')
    #find(:xpath, "//select[@id='account-nav-select']").select('Profile & Preferences')
    find(ta('stageCom:accountPage:settingsDropdown')).select('Profile & Preferences')

    #click to edit name
    #find(:xpath, ta('stageCom:accountPage:name', "(//a[@class='account-snippet__edit-button'])[1]")).click
    #find(:xpath, "(//a[@class='account-snippet__edit-button'])[1]").click
    find(ta('stageCom:accountPage:name')).click

    #enter new name in input
    #find(:xpath, ta('stageCom:accountPage:editFirstName', "//input[@id='profile-first-name']")).set('test')
    #find(:xpath, "//input[@id='profile-first-name']").set('test')
    find(ta('stageCom:accountPage:editFirstName')).set('test')

    #accept changes
    #find(:xpath, ta('stageCom:accountPage:saveChanges', "//input[@value='Save']")).click
    #find(:xpath, "//input[@value='Save']").click
    find(ta('stageCom:accountPage:saveChanges')).click

    sleep 5
  end
end
end
