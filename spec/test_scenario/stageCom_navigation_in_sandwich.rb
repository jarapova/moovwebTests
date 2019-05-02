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
  scenario 'Stage.com - navigation to subcategory in hamburger menu' do

    visit 'https://www.stage.com/'

    sleep 5
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta('stageCom:mainPage:sandwichMenu')).click

    if page.has_xpath?("//div[@class='acsCloseButton--container']")
      find(:xpath, "//a[@class='acsCloseButton--link acsCloseButton acsDeclineButton']").click
    end

    #select category
    #find(:xpath, ta('stageCom:mainPage:categoryMen', "//ul/a[@data-menu-id='Men']")).click
    #find(:xpath, "//ul/a[@data-menu-id='Men']").click
    find(ta('stageCom:mainPage:categoryMen')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategoryAllMen', "//a[text()='Shop All Men']")).click
    #find(:xpath, "//a[text()='Shop All Men']").click
    find(ta('stageCom:mainPage:subcategoryAllMen')).click

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta('stageCom:mainPage:sandwichMenu')).click

    #select category
    #find(:xpath, ta('stageCom:mainPage:categoryKids', "//ul/a[@data-menu-id='Kids']")).click
    #find(:xpath, "//ul/a[@data-menu-id='Kids']").click
    find(ta('stageCom:mainPage:categoryKids')).click

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategoryBaby', "(//a[text()='Baby'])[1]")).click
    #find(:xpath, "(//a[text()='Baby'])[1]").click
    find(ta('stageCom:mainPage:subcategoryBaby')).click

    if page.has_xpath?("//div[@class='acsCloseButton--container']")
      find(:xpath, "//a[@class='acsCloseButton--link acsCloseButton acsDeclineButton']").click
    end

    #select subcategory
    #find(:xpath, ta('stageCom:mainPage:subcategoryBabyGirl', "(//a[text()='Baby Girl (0-24 months)'])[1]")).click
    #find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click
    find(ta('stageCom:mainPage:subcategoryBabyGirl')).click

    sleep 5
  end
end
end
