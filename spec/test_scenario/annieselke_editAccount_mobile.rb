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
  scenario 'Annie Selke - edit account' do
    visit 'https://annieselke.com/'

    #click to close modal
    sleep 5
    within_frame(0) do
        page.execute_script("document.querySelector('button.close').click()")
    end

    #click on hamburger menu
    sleep 5
    find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    # find(ta(   'annieselke:mainPage:hamburgerMenu')).click

    #click on login link,  it's on the left top page
    #find(:xpath, ta('annieselke:mainPage:login', "//a[text()='Login']")).click
    #find(:xpath, "гl.header-link-items ").click
    find(ta(   'annieselke:mainPage:login')).click

    #enter email
    #find(:xpath, ta('annieselke:loginPage:mobile:signInEmail', "//input[@id='j_username']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='j_username']").set('julia.arapova@softesis.com')
    find(ta(   'annieselke:loginPage:mobile:signInEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('annieselke:loginPage:mobile:pass', "//input[@id='j_password']")).set('1234tesT')
    #find(:xpath, "//input[@id='j_password']").set('1234tesT')
    find(ta(   'annieselke:loginPage:mobile:pass')).set('1234tesT')

    #click on login btn
    #find(:xpath, ta('annieselke:loginPage:mobile:loginBtn', "//button[text()='Login']")).click
    #find(:xpath, "//button[text()='Login']").click
    find(ta(   'annieselke:loginPage:mobile:loginBtn')).click

    sleep 5

    #click on hamburger menu
    find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    # find(ta(   'annieselke:mainPage:hamburgerMenu')).click

    sleep 4
    #click on My Account to enter
    #find(:xpath, (ta'annieselke:loginPage:mobile:myAccount', "//a[text()='My Account']")).click
    #find(:xpath, "//a[text()='My Account']").click
    find(ta(   'annieselke:loginPage:mobile:myAccount')).click
    sleep 4

    #click 'Update personal details' on My Profile
    #find(:xpath, ta('annieselke:loginPage:profileEdit', "(//div[@class='account-tile-links']/ul/li[1])[1]")).click
    #find(:xpath, "(//div[@class='account-tile-links']/ul/li[1])[1]").click
    find(ta(   'annieselke:loginPage:profileEdit')).click

    #change title
    #find(:xpath, ta('annieselke:accountPage:profileTitle', "//select[@id='profile.title']")).select('Ms')
    #find(:xpath, "//select[@id='profile.title']").select('Ms')
    find(ta(   'annieselke:accountPage:profileTitle')).select('Ms')

    #click save updates
    #find(:xpath, ta('annieselke:loginPage:saveUpdates', "//button[text()='Save Updates']")).click
    #find(:xpath, "//button[text()='Save Updates']").click
    find(ta(   'annieselke:loginPage:saveUpdates')).click

    sleep 5
  end
end
end
