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
        #find(:xpath, ta('stageCom:mainPage:categoryKids', "//ul/a[@data-menu-id='Kids']")).click
        #find(:xpath, "//ul/a[@data-menu-id='Kids']").click
        find(ta('stageCom:mainPage:categoryKids')).click

        #select subcategory
        #find(:xpath, ta('stageCom:mainPage:subcategor:baby', "(//a[text()='Baby'])[1]")).click
        #find(:xpath, "(//a[text()='Baby'])[1]").click
        find(ta('stageCom:mainPage:subcategory:baby')).click

        #select subcategory
        #find(:xpath, ta('stageCom:mainPage:subcategory:babyGirl', "(//a[text()='Baby Girl (0-24 months)'])[1]")).click
        #find(:xpath, "(//a[text()='Baby Girl (0-24 months)'])[1]").click
        find(ta('stageCom:mainPage:subcategory:babyGirl')).click

        if page.has_xpath?("//span[@class='modalClose modal-close']")
          find(:xpath, "//span[@class='modalClose modal-close']").click
        end

        sleep 2
        #select subcategory
        #find(:xpath, ta('stageCom:productPage:girlDress', "//h2[text()='Dresses']")).click
        #find(:xpath, "//h2[text()='Dresses']").click
        find(ta('stageCom:productPage:girlDress')).click

        #select first product on page
        #find(:xpath, ta('stageCom:productPage:girlDress:pinkDress', "(//a[@class='product-image'])[1]")).click
        #find(:xpath, "(//a[@class='product-image'])[1]").click
        find(ta('stageCom:productPage:girlDress:pinkDress')).click

        #select product size
        find(:xpath, ta('stageCom:productPage:babySize', "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]")).click
        #find(:xpath, "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]").click
        # find(ta('stageCom:productPage:babySize')).click

        if page.has_xpath?("//div[@class='acsCloseButton--container']")
          find(:xpath, "//a[@class='acsCloseButton--link acsCloseButton acsDeclineButton']").click
        end

        sleep 2

        #add to cart
        #find(:xpath, ta('stageCom:prodPage:addToCart', "//input[@id='addtobag']")).click
        #find(:xpath, "//input[@id='addtobag']").click
        find(ta('stageCom:prodPage:addToCart')).click

        #open minicart
        #find(:xpath, ta('stageCom:mainPage:minicart', "//a[@class='m-header__minicart m-header__miniCartInnerContent']")).click
        #find(:xpath, "//a[@class='m-header__minicart m-header__miniCartInnerContent']").click
        find(ta('stageCom:mainPage:minicart')).click

        sleep 3

        #click on Proceed To Checkout
        #find(:xpath, ta('stageCom:cartPage:proceedToCheckout', "(//input[@class='proceed-button button button-primary'])[1]")).click
        #find(:xpath, "(//input[@class='proceed-button button button-primary'])[1]").click
        find(ta('stageCom:cartPage:proceedToCheckout')).click

        #enter email
        #find(:xpath, ta('stageCom:loginPage:accountEmail', "//input[@id='email']")).set('julia.arapova@softesis.com')
        #find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')
        find(ta('stageCom:loginPage:accountEmail')).set('julia.arapova@softesis.com')

        #enter password
        #find(:xpath, ta('stageCom:loginPage:accountPassword', "//input[@id='password']")).set('1234tesT')
        #find(:xpath, "//input[@id='password']").set('1234tesT')
        find(ta('stageCom:loginPage:accountPassword')).set('1234tesT')

        if page.has_xpath?("//span[@class='modalClose modal-close']")
          find(:xpath, "//span[@class='modalClose modal-close']").click
        end

        #click on signIn&Checkout
        #find(:xpath, ta('stageCom:cartPage:signInCheckout', "(//input[@class='button button-secondary'])[1]")).click
        #find(:xpath, "(//input[@class='button button-secondary'])[1]").click
        find(ta('stageCom:cartPage:signInCheckout')).click

        ##enter Shipping information

        #enter first name
        #find(:xpath, ta('stageCom:checkoutPage:firstName', "//input[@id='fName']")).set('James')
        #find(:xpath, "//input[@id='fName']").set('James')
        find(ta('stageCom:checkoutPage:firstName')).set('James')

        #enter last name
        #find(:xpath, ta('stageCom:checkoutPage:lastName', "//input[@id='lName']")).set('Bond')
        #find(:xpath, "//input[@id='lName']").set('Bond')
        find(ta('stageCom:checkoutPage:lastName')).set('Bond')

        # enter sreet adress
        #find(:xpath, ta('stageCom:checkoutPage:streetAdress', "//input[@id='add1']")).set('Avenu st.')
        #find(:xpath, "//input[@id='add1']").set('Avenu st.')
        find(ta('stageCom:checkoutPage:streetAdress')).set('Avenu st.')

        #enter apt adress
        #find(:xpath, ta('stageCom:checkoutPage:aptAdress', "//input[@id='add2']")).set('apt.22, NY')
        #find(:xpath, "//input[@id='add2']").set('apt.22, NY')
        find(ta('stageCom:checkoutPage:aptAdress')).set('apt.22, NY')

        #enter zipcode
        #find(:xpath, ta('stageCom:checkoutPage:zipcode', "//input[@id='address_postalCode']")).set('7070')
        #find(:xpath, "//input[@id='address_postalCode']").set('7070')
        find( ta('stageCom:checkoutPage:zipcode')).set('7070')

        #enter city
        #find(:xpath, ta('stageCom:checkoutPage:city', "//input[@id='city']")).set('NY')
        #find(:xpath, "//input[@id='city']").set('NY')
        find(ta('stageCom:checkoutPage:city')).set('NY')

        #enter city
        #find(:xpath, ta('stageCom:checkoutPage:city', "//input[@id='city']")).set('New York')
        #find(:xpath, "//input[@id='city']").set('New York')
        find(ta('stageCom:checkoutPage:city')).set('New York')

        if page.has_xpath?("//span[@class='modalClose modal-close']")
          find(:xpath, "//span[@class='modalClose modal-close']").click
        end

        #enter state
        #find(:xpath, ta('stageCom:checkoutPage:state', "//select[@id='state']")).select('NY')
        #find(:xpath, "//select[@id='state']").select('NY')
        find(ta('stageCom:checkoutPage:state')).select('NY')

        #enter phone
        #find(:xpath, ta('stageCom:checkoutPage:phone', "//input[@id='HiddenPhone']")).set('000000000')
        #find(:xpath, "//input[@id='HiddenPhone']").set('000000000')
        find(ta('stageCom:checkoutPage:phone')).set('000000000')

        #click to continue
        #find(:xpath, ta('stageCom:checkoutPage:continue', "//input[@id='btnContinue']")).click
        #find(:xpath, "//input[@id='btnContinue']").click
        find(ta('stageCom:checkoutPage:continue')).click

        sleep 5
    end
  end
end
