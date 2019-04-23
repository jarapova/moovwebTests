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

    sleep 10
    expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
    #go to stage site and click to close modal
    find(:xpath, "//span[@class='modalClose modal-close']").click

    #click on sandwich menu
    find(:xpath, "//button[@id='nav-button']").click

    #select category
    find(:xpath, "//ul/a[@data-menu-id='Kids']").click

    #select subcategory
    find(:xpath, "(//a[text()='Baby'])[1]").click

    #select subcategory
    find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click

    #select subcategory
    find(:xpath, "//h2[text()='Dresses']").click

    sleep 4
    #select first product on page
    find(:xpath, "(//a[@class='product-image'])[1]").click

    #select product size
    find(:xpath, "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]").click
    #
    # sleep 2

    #add to cart
    find(:xpath, "//input[@id='addtobag']").click

    sleep 5
  end
end
end