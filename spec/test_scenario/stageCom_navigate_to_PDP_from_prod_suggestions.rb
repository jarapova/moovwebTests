require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Navigate to PDP from product suggestions' do
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

    #click to select deals
    find(:xpath, ta('stageCom:mainPage:todaysDeals', "//ul/a[1]")).click
    #find(:xpath, "//ul/a[1]").click
    #find(:xpath, ta('stageCom:mainPage:todaysDeals')).click

    #choose deals
    find(:xpath, ta('stageCom:prodPage:deals', "(//div[@class='shopnow-btn']/div/a)[1]")).click
    #find(:xpath, "(//div[@class='shopnow-btn']/div/a)[1]").click
    #find(:xpath, ta('stageCom:prodPage:deals')).click

    #choose deals category (second^ woomen's clearance)
    find(:xpath, ta('stageCom:prodPage:dealsCategory', "(//h2[@class='spotlight-categories__title'])[2]")).click
    #find(:xpath, "(//h2[@class='spotlight-categories__title'])[2]").click
    #find(:xpath, ta('stageCom:prodPage:dealsCategory')).click

    #choose deals prodact - Rebecca Malone Women's Basic Knit T-shirt
    find(:xpath, ta('stageCom:prodPage:dealsProduct', "(//a[@class='catalog-item__title'])[4]")).click
    #find(:xpath, "(//div[@class='catalog-item__price-labels'])[4]").click
    #find(:xpath, ta('stageCom:prodPage:dealsProduct')).click

    sleep 15
  end
end
