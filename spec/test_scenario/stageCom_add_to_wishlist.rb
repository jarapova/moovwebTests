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
  scenario 'Stage.com - Add item to wishlist' do
    visit 'https://www.stage.com/'
    sleep 5

    # if a modal window appears on the page, it should be closed
    #click to close modal
    if page.has_xpath?("//span[@class='modalClose modal-close']")
      find(:xpath, "//span[@class='modalClose modal-close']").click
    end

    #click on sandwich menu
    #find(:xpath, ta('stageCom:mainPage:sandwichMenu', "//button[@id='nav-button']")).click
    #find(:xpath, "//button[@id='nav-button']").click
    find(ta('stageCom:mainPage:sandwichMenu')).click

## login in account
    #click to sign in in top of page
    #find(:xpath, ta('stageCom:mainPage:singIn', "//p[@class='m-menu__account__links']/a[text()='Sign in']")).click
    #find(:xpath, "//p[@class='m-menu__account__links']/a[text()='Sign up']").click
    find(ta('stageCom:mainPage:singIn')).click

    sleep 3

    #enter email
    #find(:xpath, ta('stageCom:loginPage:accountEmail', "//input[@id='email']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='email']").set('julia.arapova@softesis.com')
    find(ta('stageCom:loginPage:accountEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('stageCom:loginPage:accountPassword', "//input[@id='password']")).set('1234tesT')
    #find(:xpath, "//input[@id='password']").set('1234tesT')
    find(ta('stageCom:loginPage:accountPassword')).set('1234tesT')

    #click Sign In to login
    #find(:xpath, ta('stageCom:loginPage:signIn', "//input[@value='sign in']")).click
    #find(:xpath, "//input[@value='sign in']").click
    find(ta('stageCom:loginPage:signIn')).click
##
    # close modal2
    if page.has_xpath?("//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']")
      find(:xpath, "//div[@class='modal modal-join-rewards']//button[@class='modal__header__close-button']").click
    end

    #click on logo img
    #find(:xpath, ta('stageCom:mainPage:logo', "//a[@class='m-header__logo']")).click
    #find(:xpath, "//a[@class='m-header__logo']").click
    find(ta('stageCom:mainPage:logo')).click

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
    find(:xpath, ta('stageCom:productPage:girlDress', "//h2[text()='Dresses']")).click
    #find(:xpath, "//h2[text()='Dresses']").click
    #find(ta('stageCom:productPage:girlDress')).click

    sleep 5
    #select first product on page
    #find(:xpath, ta('stageCom:productPage:girlDress:pinkDress', "(//a[@class='product-image'])[1]")).click
    #find(:xpath, "(//a[@class='product-image'])[1]").click
    find(ta('stageCom:productPage:girlDress:pinkDress')).click

    #select product size
    #find(:xpath, ta('stageCom:productPage:babySize', "(//div[@class='pdp__size']//a[@class='attr-swatch'])[1]")).click
    #find(:xpath, "//a[@data-size-id='7000489']").click
    find(ta('stageCom:productPage:babySize')).click

    if page.has_xpath?("//div[@class='acsCloseButton--container']")
      find(:xpath, "//a[@class='acsCloseButton--link acsCloseButton acsDeclineButton']").click
    end

    #add to wish list
    # find(:xpath, ta('stageCom:productPage:addToWishList', "//button[@class='wishlist-button']")).click
    #find(:xpath, "//button[@class='wishlist-button']").click
    find(ta('stageCom:productPage:addToWishList')).click

    sleep 5
  end
end
end
