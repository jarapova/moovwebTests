require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Stage.com - add item to cart' do
    caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
    caps_chrome['chromeOptions'] = {'mobileEmulation' => {
      'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
      'userAgent' => "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 5 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19"
    }}
    caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
    Capybara.register_driver :true_automation_driver do |app|
      TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps_chrome)

    end

    visit 'https://www.stage.com/'

    sleep 4
    #go to stage site and click to close modal

    expect(page).to have_selector(:xpath, "//span[@class='modalClose modal-close']", visible:true)
    #go to stage site and click to close modal
    #find(:xpath, ta('stageCom:mainPage:modalClose', "//span[@class='modalClose modal-close']")).click
    #find(:xpath, "//span[@class='modalClose modal-close']").click
    find(ta('stageCom:mainPage:modalClose')).click

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

    #select subcategory
    #find(:xpath, ta('stageCom:productPage:girlDress', "//h2[text()='Dresses']")).click
    #find(:xpath, "//h2[text()='Dresses']").click
    find(ta('stageCom:productPage:girlDress')).click

    #select first product on page
    #find(:xpath, ta('stageCom:productPage:girlDress:pinkDress', "//a[@class='product-image'][1]")).click
    #find(:xpath, "//a[@class='product-image'][1]").click
    find(ta('stageCom:productPage:girlDress:pinkDress')).click

    #select product size
    #find(:xpath, ta('stageCom:productPage:babySize', "//a[@data-size-id='7000489']")).click
    #find(:xpath, "//a[@data-size-id='7000489']").click
    find(ta('stageCom:productPage:babySize')).click

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

    #click on signIn&Checkout
    #find(:xpath, ta('stageCom:cartPage:signInCheckout', "//input[@class='button button-secondary']")).click
    #find(:xpath, "//input[@class='button button-secondary']").click
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
