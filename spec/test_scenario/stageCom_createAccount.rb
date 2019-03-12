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

    sleep 5
    #go to stage site and click to close modal
    find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    #find(:xpath, ta(   'stageCom:mainPage:modalClose')).click

    #click on sandwich menu
    find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    #find(:xpath, ta(   'stageCom:mainPage:sandwichMenu')).click

    #click to sign up in top of page
    find(:xpath, ta('stageCom:mainPage:singUp', "//p[@class='m-menu__account__links']/a[2]")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[2]").click
    #find(:xpath, ta(   'stageCom:mainPage:singUp')).click

    #enter first name
    find(:xpath, ta('stageCom:loginPage:firstName', "//input[@id='first-name']")).click
    #find(:xpath, "//input[@id='first-name']").click
    #find(:xpath, ta(   'stageCom:loginPage:firstName')).click

    #enter last name
    find(:xpath, ta('stageCom:loginPage:lastName', "//input[@id='last-name']")).click
    #find(:xpath, "//input[@id='last-name']").click
    #find(:xpath, ta(   'stageCom:loginPage:lastName')).click

    #enter email
    find(:xpath, ta('stageCom:loginPage:email', "//input[@id='email-address']")).click
    #find(:xpath, "//input[@id='email-address']").click
    #find(:xpath, ta(   'stageCom:loginPage:email')).click

    #enter password
    find(:xpath, ta('stageCom:loginPage:password', "//input[@id='set-password']")).click
    #find(:xpath, "//input[@id='set-password']").click
    #find(:xpath, ta(   'stageCom:loginPage:password')).click

    #confirm password
    find(:xpath, ta('stageCom:loginPage:confirmPassword', "//input[@id='confirm-password']")).click
    #find(:xpath, "//input[@id='confirm-password']").click
    #find(:xpath, ta(   'stageCom:loginPage:confirmPassword')).click

    #click signUp to complete registration
    find(:xpath, ta('stageCom:loginPage:signUp', "//input[@value='Sign Up']")).click
    #find(:xpath, "//input[@value='Sign Up']").click
    #find(:xpath, ta(   'stageCom:loginPage:signUp')).click

    #close modal after registration
    #find(:xpath, ta('stageCom:mainPage:registerModalClose', "//span[@class='modal__header__close']")).click
    #find(:xpath, "//span[@class='modal__header__close']").click
    #find(:xpath, ta(   'stageCom:mainPage:registerModalClose')).click
    sleep 15
  end
end
