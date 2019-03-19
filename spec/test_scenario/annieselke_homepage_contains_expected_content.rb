require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - Homepage contains expected content' do
      caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
      caps_chrome['chromeOptions'] = {'mobileEmulation' => {
        'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
        'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
      }}
      caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
      Capybara.register_driver :true_automation_driver do |app|
        TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
      end

    visit 'https://annieselke.com/'

    carusel = "(//div[@class='jss131 jss129'])[1]"
    rugs = "//span[text()='Rugs']"

#    When(/^user selects “My account” icon in header$/) do
      p "I am expect carusel in hesder"
      expect(page).to have_selector(:xpath, carusel)
      p 'I see carusel in header'
      find(:xpath, ta("annieselke:mainPage:rugsButton", rugs)).click
      p "Account icon clicked"
#  end




    sleep 5
  end
end
