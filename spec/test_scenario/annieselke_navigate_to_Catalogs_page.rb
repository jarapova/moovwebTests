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
  scenario 'Annie Selke - Navigate to "Catalogs" page' do
    visit 'https://annieselke.com'

    sleep 4
    within_frame(0) do
        page.execute_script("document.querySelector('button.close').click()")
    end

    sleep 1
    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(:xpath, ta('annieselke:mainPage:hamburgerMenu')).click

    #click on "The company" category
    #find(:xpath, ta('annieselke:mainPage:companyCategory', "//h6/div[text()='The Company']")).click
    # find(:xpath, "//h6/div[text()='The Company']").click
    find(ta('annieselke:mainPage:companyCategory')).click

    #click on "Catalog" subcategory
    # find(:xpath, ta('annieselke:mainPage:subcategoryCatalog', "//p/a[text()='Catalog']")).click
    # find(:xpath, "//p/a[text()='Catalog']").click
    find(ta('annieselke:mainPage:subcategoryCatalog')).click

    #open random catalog
    #find(:xpath, ta('annieselke:mainPage:firstCatalog', "//div[@class='catalog-item'][1]")).click
    #find(:xpath, "//div[@class='catalog-item'][1]").click
    find(ta('annieselke:mainPage:firstCatalog')).click

    #navigating to slider by clicking on
    # find(:xpath, ta('annieselke:ideasInspirationPage:slider', "//div[@id='slider']")).click
    find(:xpath, "//div[@class='dynamic-hotspots']").click
    # find(ta('annieselke:ideasInspirationPage:slider')).click

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
end
