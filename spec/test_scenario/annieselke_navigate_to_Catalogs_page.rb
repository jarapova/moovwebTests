require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - Navigate to "Catalogs" page' do
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

    sleep 1
    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(:xpath, ta('annieselke:mainPage:hamburgerMenu')).click

    #click on "The company" category
    #find(:xpath, ta('annieselke:mainPage:companyCategory', "//h6/div[text()='The Company']")).click
    #find(:xpath, "//h6/div[text()='The Company']").click
    find(ta('annieselke:mainPage:companyCategory')).click

    #click on "Catalog" subcategory
    #find(:xpath, ta('annieselke:mainPage:subcategoryCatalog', "//p/a[text()='Catalog']")).click
    #find(:xpath, "//p/a[text()='Catalog']").click
    find(ta('annieselke:mainPage:subcategoryCatalog')).click

    #open random catalog
    #find(:xpath, ta('annieselke:mainPage:firstCatalog', "//div[@class='catalog-item'][1]")).click
    #find(:xpath, "//div[@class='catalog-item'][1]").click
    find(ta('annieselke:mainPage:firstCatalog')).click

    #navigating to slider by clicking on
    #find(:xpath, ta('annieselke:ideasInspirationPage:slider', "//div[@id='slider']")).click
    #find(:xpath, "//div[@id='slider']").click
    find(ta('annieselke:ideasInspirationPage:slider')).click

    #navigating to PDP by clicking
    #find(:xpath, ta('annieselke:ideasInspirationPage:product', "(//li/div[@class='content'])[1]")).click
    #find(:xpath, "(//li/div[@class='content'])[1]").click
    find(ta('annieselke:ideasInspirationPage:product')).click

    productName = "//section[@class='summary']/h1"

    p "I am expect to see product name"
    expect(page).to have_selector(:xpath, productName)
    p "product name is present"

    sleep 5
    end
end
