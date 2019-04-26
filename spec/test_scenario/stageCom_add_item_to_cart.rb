require 'spec_helper'
describe 'Preconditions' do

  before (:all) do
    $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone X'}
    # Capybara.current_session.driver.browser.manage.window.resize_to(320,568)
  end

  after (:all) do
    Capybara.current_session.driver.quit
    # Capybara.current_session.driver.browser.manage.window.resize_to(1024,640)
  end
feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - add item to cart' do

    visit 'https://www.stage.com/'

    sleep 5
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta('stageCom:mainPage:sandwichMenu')).click

    #select category
    find(:xpath, ta('stageCom:mainPage:categoryKids', "//ul/a[@data-menu-id='Kids']")).click
    #find(:xpath, "//ul/a[@data-menu-id='Kids']").click
    #find(ta('stageCom:mainPage:categoryKids')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategor:baby', "(//a[text()='Baby'])[1]")).click
    #find(:xpath, "(//a[text()='Baby'])[1]").click
    find(ta('stageCom:mainPage:subcategory:baby')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategory:babyGirl', "(//a[text()='Baby Girl (0-24 months)'])[1]")).click
    #find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click
    find(ta('stageCom:mainPage:subcategory:babyGirl')).click

    #select subcategory
    #find(:xpath, ta('stageCom:productPage:girlDress', "//h2[text()='Dresses']")).click
    #find(:xpath, "//h2[text()='Dresses']").click
    find(ta('stageCom:productPage:girlDress')).click

    sleep 4
    #select first product on page
    #find(:xpath, ta('stageCom:productPage:girlDress:pinkDress', "(//a[@class='product-image'])[1]")).click
    #find(:xpath, "(//a[@class='product-image'])[1]").click
    find(ta('stageCom:productPage:girlDress:pinkDress')).click

    #select product size
    #find(:xpath, ta('stageCom:productPage:babySize', "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]")).click
    #find(:xpath, "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]").click
    find(ta('stageCom:productPage:babySize')).click

    sleep 2

    #add to cart
    find(:xpath, ta('stageCom:prodPage:addToCart', "//input[@id='addtobag']")).click
    #find(:xpath, "//input[@id='addtobag']").click
    #find(ta('stageCom:prodPage:addToCart')).click

    sleep 5
  end
end
end
