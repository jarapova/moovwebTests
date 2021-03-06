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
  scenario 'Annie Selke - Navigate to PDP from product suggestions (Complete the look)' do
    visit 'https://annieselke.com/Bedding/Brussels-Quilt/p/Q260'

    sleep 5

    productName = "(//div[@data-page='Product']//h6)[1]"
    addToCardBtn = "(//span[text()='Add to Cart'])[1]"
    completeTheLook = "//h6[text()='Complete the Look']"

    p "I am expect to see 'Complete the Look' on product page"
    expect(page).to have_selector(:xpath, completeTheLook)

    #navigating to PDP by clicking complete the look product image
    #find(:xpath, ta('annieselke:productPage:completeTheLookProduct', "(//a[@class='jss56'])[4]")).click
    #find(:xpath, "(//a[@class='jss56'])[4]").click
    find(ta('annieselke:productPage:completeTheLookProduct')).click

    p "I am expect to see product name on top of page"
    expect(page).to have_selector(:xpath, productName)
    p 'product name is present'
    expect(page).to have_selector(:xpath, addToCardBtn)
    p "Button is present"

    sleep 5
    end
  end
end
