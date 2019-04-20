require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - add item to cart' do
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

    sleep 10
    expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
    #go to stage site and click to close modal
    #find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    find(ta(   'stageCom:mainPage:modalClose')).click

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta(   'stageCom:mainPage:sandwichMenu')).click

    #select category
    find(:xpath, ta('stageCom:mainPage:categoryKids', "//ul/a[@data-menu-id='Kids']")).click
    #find(:xpath, "//ul/a[@data-menu-id='Kids']").click
    #find(ta(   'stageCom:mainPage:categoryKids')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategor:baby', "(//a[text()='Baby'])[1]")).click
    #find(:xpath, "(//a[text()='Baby'])[1]").click
    find(ta(   'stageCom:mainPage:subcategory:baby')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategory:babyGirl', "(//a[text()='Baby Girl (0-24 months)'])[1]")).click
    #find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click
    find(ta(   'stageCom:mainPage:subcategory:babyGirl')).click

    #select subcategory
    #find(:xpath, ta('stageCom:productPage:girlDress', "//h2[text()='Dresses']")).click
    #find(:xpath, "//h2[text()='Dresses']").click
    find(ta(   'stageCom:productPage:girlDress')).click

    #select first product on page
    #find(:xpath, ta('stageCom:productPage:girlDress:pinkDress', "(//a[@class='product-image'])[1]")).click
    #find(:xpath, "//a[@class='product-image'][1]").click
    find(ta(   'stageCom:productPage:girlDress:pinkDress')).click

    #select product size
    #find(:xpath, ta('stageCom:productPage:babySize', "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]")).click
    #find(:xpath, "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]").click
    find(ta(   'stageCom:productPage:babySize')).click

    sleep 2

    #add to cart
    find(:xpath, ta('stageCom:prodPage:addToCart', "//input[@id='addtobag']")).click
    #find(:xpath, "//input[@id='addtobag']").click
    #find(ta(   'stageCom:prodPage:addToCart')).click

    sleep 5
  end
end
