require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - navigation to subcategory in hamburger menu' do
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
    expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
    #go to stage site and click to close modal
    #find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    find(ta('stageCom:mainPage:modalClose')).click

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta('stageCom:mainPage:sandwichMenu')).click

    #select category
    #find(:xpath, ta('stageCom:mainPage:categoryMen', "//ul/a[@data-menu-id='Men']")).click
    #find(:xpath, "//ul/a[@data-menu-id='Men']").click
    find(ta('stageCom:mainPage:categoryMen')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategoryAllMen', "//a[text()='Shop All Men']")).click
    #find(:xpath, "//a[text()='Shop All Men']").click
    find(ta('stageCom:mainPage:subcategoryAllMen')).click

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta('stageCom:mainPage:sandwichMenu')).click

    #select category
    #find(:xpath, ta('stageCom:mainPage:categoryKids', "//ul/a[@data-menu-id='Kids']")).click
    #find(:xpath, "//ul/a[@data-menu-id='Kids']").click
    find(ta('stageCom:mainPage:categoryKids')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategoryBaby', "(//a[text()='Baby'])[1]")).click
    #find(:xpath, "(//a[text()='Baby'])[1]").click
    find(ta('stageCom:mainPage:subcategoryBaby')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategoryBabyGirl', "(//a[text()='Baby Girl (0-24 months)'])[1]")).click
    #find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click
    find(ta('stageCom:mainPage:subcategoryBabyGirl')).click

    sleep 5
  end
end
