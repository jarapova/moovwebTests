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
  scenario 'Annie Selke - reaching account page from hamburger menu' do
    visit 'https://annieselke.com/'

    sleep 2
    within_frame(0) do
         # expect(page).to have_selector(:xpath, "//button[@class='offer-control close']", visible:true)
        find(:xpath, ta('annieselke:mainPage:modalSelectorCloseMobile', "//button[@class='offer-control close']")).click
    end

    sleep 3
    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta(   'annieselke:mainPage:hamburgerMenu')).click

    #click on login link,  it's on the left top page
    #find(:xpath, ta('annieselke:mainPage:login', "//a[text()='Login']")).click
    #find(:xpath, "//a[text()='Login']").click
    find(ta(   'annieselke:mainPage:login')).click

    #enter email
    #find(:xpath, ta('annieselke:mainPage:signInEmail', "//input[@id='j_username']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='j_username']").set('julia.arapova@softesis.com')
    find(ta(   'annieselke:mainPage:signInEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('annieselke:loginPage:pass', "//input[@id='j_password']")).set('1234tesT')
    #find(:xpath, "//input[@id='j_password']").set('1234tesT')
    find(ta(   'annieselke:loginPage:pass')).set('1234tesT')

    #click on login btn
    #find(:xpath, ta('annieselke:loginPage:loginBtn', "//button[text()='Login']")).click
    #find(:xpath, "//button[text()='Login']").click
    find(ta(   'annieselke:loginPage:loginBtn')).click

    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:login', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta(   'annieselke:mainPage:hamburgerMenu')).click

    #click on My Account to enter
    # find(:xpath, (ta'annieselke:loginPage:myAccount', "//a[text()='My Account']")).click
    #find(:xpath, "//a[text()='My Account']").click
    find(ta(   'annieselke:loginPage:myAccount')).click

    sleep 5
  end
end
end
