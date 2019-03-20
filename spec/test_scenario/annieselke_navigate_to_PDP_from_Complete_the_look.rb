require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - Navigate to PDP from product suggestions (Complete the look)' do
      caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
      caps_chrome['chromeOptions'] = {'mobileEmulation' => {
        'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
        'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
      }}
      caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
      Capybara.register_driver :true_automation_driver do |app|
        TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
      end

    visit 'https://annieselke.com/Bedding/Brussels-Quilt/p/Q260'

    sleep 1

    productName = "//h6[@class='jss199 jss216 jss197']"
    addToCardBtn = "(//span[text()='Add to Cart'])[1]"
    completeTheLook = "//h6[text()='Complete the Look']"

    p "I am expect to see 'Complete the Look' on product page"
    expect(page).to have_selector(:xpath, completeTheLook)

    #navigating to PDP by clicking complete the look product image
    #find(:xpath, ta('annieselke:productPage:completeTheLookProduct', "(//a[@class='jss56'])[4]")).click
    #find(:xpath, "(//a[@class='jss56'])[4]").click
    find(:xpath, ta('annieselke:productPage:completeTheLookProduct')).click

    p "I am expect to see product name on top of page"
    expect(page).to have_selector(:xpath, productName)
    p 'product name is present'
    expect(page).to have_selector(:xpath, addToCardBtn)
    p "Button is present"
    sleep 5
    end
end
