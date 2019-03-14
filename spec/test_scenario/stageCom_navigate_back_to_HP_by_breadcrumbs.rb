require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Navigate back to home page using breadcrumbs=' do
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
    caps_chrome['chromeOptions'] = {'mobileEmulation' => {
      'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
      'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    }}
    caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
    Capybara.register_driver :true_automation_driver do |app|
      TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)

    end

    visit 'https://www.stage.com/b/kids-baby-nursery-decor/N-1993scj/'

    sleep 2
    #go to stage site and click to close modal
    #find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    find(:xpath, ta('stageCom:mainPage:modalClose')).click

    #click to navigate by breadcrumps
    find(:xpath, ta('stageCom:subcategoryPage:breadcrumbs', "(//a[@class='breadcrumbs__link'])[2]")).click
    #find(:xpath, "(//a[@class='breadcrumbs__link'])[2]").click
    #find(:xpath, ta('stageCom:subcategoryPage:breadcrumbs')).click

    #click to navigate by breadcrumps
    find(:xpath, ta('stageCom:categoryPage:breadcrumbs', "(//a[@class='breadcrumbs__link'])[2]")).click
    #find(:xpath, "(//a[@class='breadcrumbs__link'])[2]").click
    #find(:xpath, ta('stageCom:categoryPage:breadcrumbs')).click

    #click to navigate by breadcrumps
    find(:xpath, ta('stageCom:mainPage:breadcrumbs', "(//a[@class='breadcrumbs__link'])[1]")).click
    #find(:xpath, "(//a[@class='breadcrumbs__link'])[1]").click
    #find(:xpath, ta('stageCom:mainPage:breadcrumbs')).click

  end
end
