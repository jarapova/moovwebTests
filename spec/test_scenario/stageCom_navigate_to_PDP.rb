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
  scenario 'Stage.com - Navigate to PDP pag' do
    visit 'https://www.stage.com/'
    sleep 10

    # if a modal window appears on the page, it should be closed
    #click to close modal
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click on cstegory on main page to navigete to subcategory page
    find(:xpath, ta('stageCom:mainPage:womenCategory', "//span[text()='WOMEN']")).click
    #find(:xpath, "//span[text()='WOMEN']").click
    # find(ta('stageCom:mainPage:womenCategory')).click

    #click on navigate on product page
    #find(:xpath, ta('stageCom:subcategoryPage:product', "(//a[@class='catalog-item__title'])[4]")).click
    #find(:xpath, "(//a[@class='catalog-item__title'])[4]").click
    find(ta('stageCom:subcategoryPage:product')).click

    sleep 5
  end
end
end
