require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Navigate to PDP pag' do
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
    find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    #find(:xpath, ta('stageCom:mainPage:modalClose')).click

    #click on cstegory on main page to navigete to subcategory page
    #find(:xpath, ta('stageCom:mainPage:womenCategory', "//span[text()='WOMEN']")).click
    #find(:xpath, "//span[text()='WOMEN']").click
    find(:xpath, ta('stageCom:mainPage:womenCategory')).click

    #click on navigate on product page
    #find(:xpath, ta('stageCom:subcategoryPage:product', "(//a[@class='catalog-item__title'])[4]")).click
    #find(:xpath, "(//a[@class='catalog-item__title'])[4]").click
    find(:xpath, ta('stageCom:subcategoryPage:product')).click

    sleep 5
  end
end
