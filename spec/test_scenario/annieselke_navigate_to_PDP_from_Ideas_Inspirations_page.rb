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
  scenario 'Annie Selke - Navigate to PDP from product suggestions (Related products)' do
    visit 'https://annieselke.com'

    slider = "//div[@id='slider']"
    productName = "//section[@class='summary']/h1"
    sleep 2
    within_frame(0) do
         # expect(page).to have_selector(:xpath, "//button[@class='offer-control close']", visible:true)
        find(:xpath, ta('annieselke:mainPage:modalSelectorCloseMobile', "//button[@class='offer-control close']")).click
    end

    sleep 5
    #click on hamburger menu
    #find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    #find(:xpath, "//button[@aria-label='Menu']").click
    find(ta('annieselke:mainPage:hamburgerMenu')).click

    #click on "Ideas, Inspirations" link in the bottom of Hamburher menu
    #find(:xpath, ta('annieselke:mainPage:ideasInspirations', "//a[text()='ideas and inspirations']")).click
    #find(:xpath, "//a[text()='ideas and inspirations']").click
    find(ta('annieselke:mainPage:ideasInspirations')).click

    #click on random gallery category
    #find(:xpath, ta('annieselke:ideasInspirationPage:galleryCategory', "//div[@data-gtm-id='IdeasandInspiration'][6]")).click
    #find(:xpath, "//div[@data-gtm-id='IdeasandInspiration'][6]").click
    find(ta('annieselke:ideasInspirationPage:galleryCategory')).click

    sleep 3
    #click on random gallery subcategory
    #find(:xpath, ta('annieselke:ideasInspirationPage:gallerySubcategory', "//div[@class='catalog-item'][2]")).click
    #find(:xpath, "//div[@class='catalog-item'][2]").click
    find(ta('annieselke:ideasInspirationPage:gallerySubcategory')).click

    p "I am expect to see slider"
    expect(page).to have_selector(:xpath, slider)
    p "Slider is present"

    #navigating to slider by clicking on
    #find(:xpath, ta('annieselke:ideasInspirationPage:slider', "//div[@id='slider']")).click
    #find(:xpath, "//div[@id='slider']").click
    find(ta('annieselke:ideasInspirationPage:slider')).click

    #navigating to PDP by clicking
    #find(:xpath, ta('annieselke:ideasInspirationPage:product', "(//li/div[@class='content'])[1]")).click
    #find(:xpath, "(//li/div[@class='content'])[1]").click
    find(ta('annieselke:ideasInspirationPage:product')).click

    p "I am expect to see product name"
    expect(page).to have_selector(:xpath, productName)
    p "product name is present"

    sleep 5
    end
end
end
