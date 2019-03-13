require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Edit account' do
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
    find(:xpath, ta('stageCom:mainPage:modalClose')).click

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(:xpath, ta('stageCom:mainPage:sandwichMenu')).click

    #click to sign in in top of page
    #find(:xpath, ta('stageCom:mainPage:singIn', "//p[@class='m-menu__account__links']/a[text()='Sign in']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(:xpath, ta('stageCom:mainPage:singIn')).click

    #enter email
    #find(:xpath, ta('stageCom:loginPage:accountEmail', "//input[@id='email']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')
    find(:xpath, ta('stageCom:loginPage:accountEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('stageCom:loginPage:accountPassword', "//input[@id='password']")).set('1234tesT')
    #find(:xpath, "//input[@id='password']").set('1234tesT')
    find(:xpath, ta('stageCom:loginPage:accountPassword')).set('1234tesT')

    #click Sign In to login
    #find(:xpath, ta('stageCom:loginPage:signIn', "//input[@value='sign in']")).click
    #find(:xpath, "//input[@value='sign in']").click
    find(:xpath, ta('stageCom:loginPage:signIn')).click

    sleep 3
    #click to select preference in dropdown
    #find(:xpath, ta('stageCom:accountPage:settingsDropdown', "//select[@id='account-nav-select']")).select('Profile & Preferences')
    #find(:xpath, "//select[@id='account-nav-select']").select('Profile & Preferences')
    find(:xpath, ta('stageCom:accountPage:settingsDropdown')).select('Profile & Preferences')

    #click to edit name
    #find(:xpath, ta('stageCom:accountPage:name', "(//a[@class='account-snippet__edit-button'])[1]")).click
    #find(:xpath, "(//a[@class='account-snippet__edit-button'])[1]").click
    find(:xpath, ta('stageCom:accountPage:name')).click

    #enter new name in input
    #find(:xpath, ta('stageCom:accountPage:editFirstName', "//input[@id='profile-first-name']")).set('test')
    #find(:xpath, "//input[@id='profile-first-name']").set('test')
    find(:xpath, ta('stageCom:accountPage:editFirstName')).set('test')

    #accept changes
    #find(:xpath, ta('stageCom:accountPage:saveChanges', "//input[@value='Save']")).click
    #find(:xpath, "//input[@value='Save']").click
    find(:xpath, ta('stageCom:accountPage:saveChanges')).click

    ## if after login you need to close modal, use this:
    #find(:xpath, ta('stageCom:mainPage:cancelModal', "//button[@class='button button-secondary button-secondary--outline']")).click
    #find(:xpath, "//button[@class='button button-secondary button-secondary--outline']").click
    #find(:xpath, ta('stageCom:mainPage:cancelModal')).click

    sleep 5
  end
end
