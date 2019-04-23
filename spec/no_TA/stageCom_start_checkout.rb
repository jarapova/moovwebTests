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
        #go to stage site and click to close modal
      if page.has_xpath?("//span[@class='modalClose modal-close']")
        find(:xpath, "//span[@class='modalClose modal-close']").click
      end
        #click on sandwich menu
        find(:xpath, "//button[@id='nav-button']").click

        #select category
        find(:xpath, "//ul/a[@data-menu-id='Kids']").click

        #select subcategory
        find(:xpath, "(//a[text()='Baby'])[1]").click

        #select subcategory
        find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click

        sleep 2
        #select subcategory
        find(:xpath, "//h2[text()='Dresses']").click

        #select first product on page
        find(:xpath, "(//a[@class='product-image'])[1]").click

        #select product size
      find(:xpath, "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]").click

        sleep 2

        #add to cart
        find(:xpath, "//input[@id='addtobag']").click

        #open minicart
        find(:xpath, "//a[@class='m-header__minicart m-header__miniCartInnerContent']").click

        sleep 5

        #click on Proceed To Checkout
        find(:xpath, "(//input[@class='proceed-button button button-primary'])[1]").click

        #enter email
        find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')

        #enter password
        find(:xpath, "//input[@id='password']").set('1234tesT')

        #click on signIn&Checkout
        find(:xpath, "(//input[@class='button button-secondary'])[1]").click

        ##enter Shipping information

        #enter first name
        find(:xpath, "//input[@id='fName']").set('James')

        #enter last name
        find(:xpath, "//input[@id='lName']").set('Bond')
        #
        # enter sreet adress
        find(:xpath, "//input[@id='add1']").set('Avenu st.')

        #enter apt adress
        find(:xpath, "//input[@id='add2']").set('apt.22, NY')

        #enter zipcode
        find(:xpath, "//input[@id='address_postalCode']").set('7070')

        #enter city
        find(:xpath, "//input[@id='city']").set('NY')

        #enter city
        find(:xpath, "//input[@id='city']").set('New York')

        #enter state
        find(:xpath, "//select[@id='state']").select('NY')

        #enter phone
        find(:xpath, "//input[@id='HiddenPhone']").set('000000000')
        #
        #click to continue
        find(:xpath, "//input[@id='btnContinue']").click

        sleep 5
    end
  end
end
