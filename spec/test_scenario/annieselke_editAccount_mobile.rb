require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - edit account' do
      caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
      caps_chrome['chromeOptions'] = {'mobileEmulation' => {
        'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
        'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
      }}
      caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
      Capybara.register_driver :true_automation_driver do |app|
        TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
      end

    visit 'https://annieselke.com/'

    sleep 3

    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta('annieselke:mainPage:hamburgerMenu')).click

    #click on login link,  it's on the left top page
    #find(:xpath, ta('annieselke:mainPage:login', "//a[text()='Login']")).click
    #find(:xpath, "гl.header-link-items ").click
    find(ta('annieselke:mainPage:login')).click

    #enter email
    #find(:xpath, ta('annieselke:loginPage:mobile:signInEmail', "//input[@id='j_username']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='j_username']").set('julia.arapova@softesis.com')
    find(ta('annieselke:loginPage:mobile:signInEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('annieselke:loginPage:mobile:pass', "//input[@id='j_password']")).set('1234tesT')
    #find(:xpath, "//input[@id='j_password']").set('1234tesT')
    find(ta('annieselke:loginPage:mobile:pass')).set('1234tesT')

    #click on login btn
    #find(:xpath, ta('annieselke:loginPage:mobile:loginBtn', "//button[text()='Login']")).click
    #find(:xpath, "//button[text()='Login']").click
    find(ta('annieselke:loginPage:mobile:loginBtn')).click

    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta('annieselke:mainPage:hamburgerMenu')).click

    sleep 4
    #click on My Account to enter
    #find(:xpath, (ta'annieselke:loginPage:mobile:myAccount', "//a[text()='My Account']")).click
    #find(:xpath, "//a[text()='My Account']").click
    find(ta('annieselke:loginPage:mobile:myAccount')).click
    sleep 4

    # click 'Update personal details' on My Profile
    #find(:xpath, ta('annieselke:loginPage:profileEdit', "(//div[@class='account-tile-links']/ul/li[1])[1]")).click
    #find(:xpath, "(//div[@class='account-tile-links']/ul/li[1])[1]").click
    find(ta('annieselke:loginPage:profileEdit')).click

    #change title
    #find(:xpath, ta('annieselke:accountPage:profileTitle', "//select[@id='profile.title']")).select('Ms')
    #find(:xpath, "//select[@id='profile.title']").select('Ms')
    find(ta('annieselke:accountPage:profileTitle')).select('Ms')

    #click save updates
    #find(:xpath, ta('annieselke:loginPage:saveUpdates', "//button[text()='Save Updates']")).click
    #find(:xpath, "//button[text()='Save Updates']").click
    find(ta('annieselke:loginPage:saveUpdates')).click

    sleep 5
  end
end
