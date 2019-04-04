require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - Navigate to PDP from "Collections" page' do
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

    sleep 10

    #go to stage site and click  to close modal
    within_frame(:xpath, ta('iFrame', "//iframe[@id='fcopt-offer-57579-content']")) do
      find(:xpath, "//button[@class='offer-control close']").click
    end

    # click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta('annieselke:mainPage:hamburgerMenu')).click

    #click on Collections category in menu
    #find(:xpath, ta('annieselke:mainPage:categoryCollections', "//li/div[text()='Collections']")).click
    #find(:xpath, "//li/div[text()='Collections']").click
    find(ta('annieselke:mainPage:categoryCollections')).click

    #click on featured in Collections category
    #find(:xpath, ta('annieselke:mainPage:subcategory:featuredCollections', "//li/div[text()='Featured Collections']")).click
    #find(:xpath, "//li/div[text()='Featured Collections']").click
    find(ta('annieselke:mainPage:subcategory:featuredCollections')).click

    #click to select "all collections" featured subcategory
    #find(:xpath, ta('annieselke:mainPage:subcategory:allCollections', "//div[text()='All Collections']")).click
    #find(:xpath, "//div[text()='All Collections']]").click
    find(ta('annieselke:mainPage:subcategory:allCollections')).click

    #click to press Laura Park Collection
    #find(:xpath, ta('annieselke:collactionsPage:lauraParkCollection', "//li/a/div/div[text()='Laura Park Collection']")).click
    #find(:xpath, "//li/a/div/div[text()='Laura Park Collection']").click
    find(ta('annieselke:collactionsPage:lauraParkCollection')).click

    #click to navigate to PDP of Laura Park Collection(click Belhaven Linen Decorative Pillow)
    #find(:xpath, ta('annieselke:productPage:lauraCollectionsPillow', "(//li/div)[3]")).click
    #find(:xpath, "(//li/div)[3]").click
    find(ta('annieselke:productPage:lauraCollectionsPillow')).click

    sleep 5
  end
end
