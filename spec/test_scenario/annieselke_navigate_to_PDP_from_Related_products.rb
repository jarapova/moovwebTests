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
    visit 'https://annieselke.com/Bedding/Brussels-Quilt/p/Q260'

    #click to close modal
    sleep 5
    within_frame(0) do
        page.execute_script("document.querySelector('button.close').click()")
    end

    sleep 3
    productName = "(//div[@data-page='Product']//h6)[1]"
    addToCardBtn = "(//span[text()='Add to Cart'])[1]"
    relatedProducts = "//h6[text()='Related Products']"

    p "I am expect to see Related Products on product page"
    expect(page).to have_selector(:xpath, relatedProducts)

    #navigating to PDP by clicking related Product image
    #find(:xpath, ta('annieselke:productPage:relatedProduct', "(//a[@class='jss56']/h6)[1]")).click
    #find(:xpath, "(//a[@class='jss56']/h6)[1]").click
    find(ta('annieselke:productPage:relatedProduct')).click

    p "I am expect to see product name on top of page"
    expect(page).to have_selector(:xpath, productName)
    p 'product name is present'
    expect(page).to have_selector(:xpath, addToCardBtn)
    p "Button is present"
    sleep 5
    end
  end
end
