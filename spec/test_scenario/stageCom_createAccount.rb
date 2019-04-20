require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Create account' do
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
    caps_chrome['chromeOptions'] = {'mobileEmulation' => {
      'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
      'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    }}
    caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
    Capybara.register_driver :true_automation_driver do |app|
      TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
    end

    visit 'https://www.stage.com/'

    sleep 10
    #go to stage site and click to close modal
    expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
    #go to stage site and click to close modal
    #find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    find(ta(   'stageCom:mainPage:modalClose')).click

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
