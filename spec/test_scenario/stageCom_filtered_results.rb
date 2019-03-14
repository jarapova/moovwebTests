require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - Apply filter to see filtered results' do
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
    caps_chrome['chromeOptions'] = {'mobileEmulation' => {
      'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
      'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    }}
    caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
    Capybara.register_driver :true_automation_driver do |app|
      TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)

    end

    visit 'https://www.stage.com/b/juniors-clothing-tops/N-wr35dq/'

    sleep 2
    #click on filter btn
    #find(:xpath, ta('stageCom:subcategoryPage:filterBtn', "//button[@class='refinements-popup-button']")).click
    #find(:xpath, "//button[@class='refinements-popup-button']").click
    find(:xpath, ta('stageCom:subcategoryPage:filterBtn')).click

    #select color filter
    #find(:xpath, ta('stageCom:subcategoryPage:filterColor', "//h4[@id='shopByTab-Color']")).click
    #find(:xpath, "//h4[@id='shopByTab-Color']").click
    find(:xpath, ta('stageCom:subcategoryPage:filterColor')).click

    #select color filter
    #find(:xpath, ta('stageCom:subcategoryPage:blueColor', "//label[@for='checkbox-filter-11222']")).click
    #find(:xpath, "//label[@for='checkbox-filter-11222']").click
    find(:xpath, ta('stageCom:subcategoryPage:blueColor')).click

    #select color filter
    #find(:xpath, ta('stageCom:subcategoryPage:applyBtn', "//input[@value='Apply']")).click
    #find(:xpath, "//input[@value='Apply']").click
    find(:xpath, ta('stageCom:subcategoryPage:applyBtn')).click

    sleep 5
  end
end
