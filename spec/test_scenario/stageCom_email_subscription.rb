require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Check email subscription' do
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

    sleep 2

    #go to stage site and click to close modal
    #find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    find(:xpath, ta(   'stageCom:mainPage:modalClose')).click

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(:xpath, ta(   'stageCom:mainPage:sandwichMenu')).click

    #click to sign up in top of page
    #find(:xpath, ta('stageCom:mainPage:singUp', "//p[@class='m-menu__account__links']/a[text()='Sign up']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(:xpath, ta(   'stageCom:mainPage:singUp')).click

    #click on logo img
    #find(:xpath, ta('stageCom:mainPage:subscriptionLink', "//p[@class='footer__title-text']/a")).click
    #find(:xpath, "//p[@class='footer__title-text']/a").click
    find(:xpath, ta(   'stageCom:mainPage:subscriptionLink')).click

    #enter first name
    #find(:xpath, ta('stageCom:accountPage:subscriptionFirstName', "//input[@id='register-first-name']")).set('someName')
    #find(:xpath, "//input[@id='register-first-name']")).set('someName')
    find(:xpath, ta(   'stageCom:accountPage:subscriptionFirstName')).set('example@gmail.com')

    #enter last name
    #find(:xpath, ta('stageCom:accountPage:subscriptionLastName', "//input[@id='register-last-name']")).set('lastNAme')
    #find(:xpath, "//input[@id='register-last-name']").set('lastNAme')
    find(:xpath, ta(   'stageCom:accountPage:subscriptionLastName')).set('lastNAme')

    #enter email
    #find(:xpath, ta('stageCom:accountPage:subscriptionEmail', "//input[@id='register-email']")).set('example@gmail.com')
    #find(:xpath, "//input[@id='register-email']").set('example@gmail.com')
    find(:xpath, ta(   'stageCom:accountPage:subscriptionEmail')).set('example@gmail.com')

    #enter phone
    #find(:xpath, ta('stageCom:accountPage:subscriptionphone', "//input[@id='register-phone']")).set('+780956749323')
    #find(:xpath, "//input[@id='register-phone']").set('+780956749323')
    find(:xpath, ta(   'stageCom:accountPage:subscriptionphone')).set('+780956749323')

    #click signUp to complete
    #find(:xpath, ta('stageCom:loginPage:signUp', "//input[@value='Sign Up']")).click
    #find(:xpath, "//input[@value='Sign Up']").click
    find(:xpath, ta(   'stageCom:loginPage:signUp')).click
    sleep 5
  end
end
