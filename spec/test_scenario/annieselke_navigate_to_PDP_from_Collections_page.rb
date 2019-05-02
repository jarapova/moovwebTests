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
  scenario 'Annie Selke - Navigate to PDP from "Collections" page' do
    visit 'https://annieselke.com/'

    #click to close modal
    sleep 5
    within_frame(0) do
        page.execute_script("document.querySelector('button.close').click()")
    end

    sleep 3
    # click on hamburger menu
    # find(:xpath, ta('annieselke:mainPage:hamburgerMenu', "//button[@aria-label='Menu']")).click
    # find(:xpath, "//a[@on='tap:moov_menu.toggle']").click
    find(ta('annieselke:mainPage:hamburgerMenu')).click

    #click on Collections category in menu
    find(:xpath, ta('annieselke:mainPage:categoryCollections', "//li/div[text()='Collections']")).click
    #find(:xpath, "//li/div[text()='Collections']").click
    # find(ta('annieselke:mainPage:categoryCollections')).click

    #click on featured in Collections category
    # find(:xpath, ta('annieselke:mainPage:subcategory:featuredCollections', "//li/div[text()='Featured Collections']")).click
    #find(:xpath, "//li/div[text()='Featured Collections']").click
    find(ta('annieselke:mainPage:subcategory:featuredCollections')).click

    #click to select "all collections" featured subcategory
    # find(:xpath, ta('annieselke:mainPage:subcategory:allCollections', "//div[text()='All Collections']")).click
    #find(:xpath, "//div[text()='All Collections']]").click
    find(ta('annieselke:mainPage:subcategory:allCollections')).click

    #click to press Laura Park Collection
    # find(:xpath, ta('annieselke:collactionsPage:lauraParkCollection', "//li/a/div/div[text()='Laura Park Collection']")).click
    #find(:xpath, "//li/a/div/div[text()='Laura Park Collection']").click
    find(ta('annieselke:collactionsPage:lauraParkCollection')).click

    #click to navigate to PDP of Laura Park Collection(click Belhaven Linen Decorative Pillow)
    #find(:xpath, ta('annieselke:productPage:lauraCollectionsPillow', "(//li/div)[3]")).click
    #find(:xpath, "(//li/div)[3]").click
    find(ta('annieselke:productPage:lauraCollectionsPillow')).click

    sleep 5
  end
end
end
