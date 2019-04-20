
require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - login/logout' do
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
    # #go to stage site and click to close modal
    expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
    # #go to stage site and click to close modal
    # #find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    # #find(:xpath, "//span[@class='modalClose modal-close']").click
    find(ta(   'stageCom:mainPage:modalClose')).click

# logIn
    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta(   'stageCom:mainPage:sandwichMenu')).click

    #click to sign in in top of page
    #find(:xpath, ta('stageCom:mainPage:singIn', "//p[@class='m-menu__account__links']/a[text()='Sign in']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(ta(   'stageCom:mainPage:singIn')).click

    #enter email
    #find(:xpath, ta('stageCom:loginPage:accountEmail', "//input[@id='email']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')
    find(ta(   'stageCom:loginPage:accountEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('stageCom:loginPage:accountPassword', "//input[@id='password']")).set('1234tesT')
    #find(:xpath, "//input[@id='password']").set('1234tesT')
    find(ta(   'stageCom:loginPage:accountPassword')).set('1234tesT')

    #click Sign In to login
    #find(:xpath, ta('stageCom:loginPage:signIn', "//input[@value='sign in']")).click
    #find(:xpath, "//input[@value='sign in']").click
    find(ta(   'stageCom:loginPage:signIn')).click

    #close modal2
    # find(:xpath, ta('stageCom:loginPage:modal2', "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']")).click
    #find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
    find(ta(   'stageCom:loginPage:modal2')).click
# logOUT
    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta(   'stageCom:mainPage:sandwichMenu')).click

    #click Sign Out to login
    #find(:xpath, ta('stageCom:loginPage:signOut', "//a[@class='sign-out']")).click
    #find(:xpath, "//a[@class='sign-out']").click
    find(ta(   'stageCom:loginPage:signOut')).click
    sleep 5

  end
end
