require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - reaching account page from hamburger menu' do
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

    #sleep 10
    #go to stage site and click  to close modal
    within_frame(:xpath, ta('iFrame', "//iframe[@id='fcopt-offer-57579-content']")) do
      find(:xpath, "//button[@class='offer-control close']").click
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
    find(:xpath, ta('annieselke:mainPage:signInEmail', "//input[@id='j_username']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='j_username']").set('julia.arapova@softesis.com')
    #find(ta(   'annieselke:mainPage:signInEmail')).set('julia.arapova@softesis.com')

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
    #find(:xpath, (ta'annieselke:loginPage:myAccount', "//a[text()='My Account']")).click
    #find(:xpath, "//a[text()='My Account']").click
    find(ta(   'annieselke:loginPage:myAccount')).click

    sleep 5
  end
end
