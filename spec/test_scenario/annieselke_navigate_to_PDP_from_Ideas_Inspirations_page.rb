require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - Navigate to PDP from product suggestions (Related products)' do
      caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
      caps_chrome['chromeOptions'] = {'mobileEmulation' => {
        'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
        'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
      }}
      caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
      Capybara.register_driver :true_automation_driver do |app|
        TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)
      end

    visit 'https://annieselke.com'

    slider = "//div[@id='slider']"
    productName = "//section[@class='summary']/h1"

    sleep 1
    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(:xpath, ta('annieselke:mainPage:hamburgerMenu')).click

    #click on "Ideas, Inspirations" link in the bottom of Hamburher menu
    #find(:xpath, ta('annieselke:mainPage:ideasInspirations', "//a[text()='ideas and inspirations']")).click
    #find(:xpath, "//a[text()='ideas and inspirations']").click
    find(:xpath, ta('annieselke:mainPage:ideasInspirations')).click

    #click on random gallery category
    #find(:xpath, ta('annieselke:ideasInspirationPage:galleryCategory', "//div[@data-gtm-id='IdeasandInspiration'][6]")).click
    #find(:xpath, "//div[@data-gtm-id='IdeasandInspiration'][6]").click
    find(:xpath, ta('annieselke:ideasInspirationPage:galleryCategory')).click

    #click on random gallery subcategory
    #find(:xpath, ta('annieselke:ideasInspirationPage:gallerySubcategory', "//div[@class='catalog-item'][2]")).click
    #find(:xpath, "//div[@class='catalog-item'][2]").click
    find(:xpath, ta('annieselke:ideasInspirationPage:gallerySubcategory')).click

    p "I am expect to see slider"
    expect(page).to have_selector(:xpath, slider)
    p "Slider is present"

    #navigating to slider by clicking on
    #find(:xpath, ta('annieselke:ideasInspirationPage:slider', "//div[@id='slider']")).click
    #find(:xpath, "//div[@id='slider']").click
    find(:xpath, ta('annieselke:ideasInspirationPage:slider')).click

    #navigating to PDP by clicking
    #find(:xpath, ta('annieselke:ideasInspirationPage:product', "(//li/div[@class='content'])[1]")).click
    #find(:xpath, "(//li/div[@class='content'])[1]").click
    find(:xpath, ta('annieselke:ideasInspirationPage:product')).click

    p "I am expect to see product name"
    expect(page).to have_selector(:xpath, productName)
    p "product name is present"

    sleep 5
    end
end
