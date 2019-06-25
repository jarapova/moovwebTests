require 'spec_helper'
require 'date'
require 'benchmark'

describe 'Preconditions' do

    before(:all) do
        $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone 5'}
    end

    after(:all) do
        Capybara.current_session.driver.quit
    end

    feature 'Testing the speed of Analyzer on the large DOM tree and testing the signature updating' do

        scenario 'Recording', ta: true do
            # User goes to the main page of the site facebook
            visit 'https://www.staff-clothes.com'

            # User clicks on hamburger menu button
            # find(:xpath, "//div[@class='hamburger-inner']").click
            # find(ta(   'signature_updating:staff:hamburgerMenu')).click
            find(:xpath,  ta('signature_updating:staff:hamburgerMenu', "//div[@class='hamburger-inner']")).click

            # User clicks for selecting Mans category
            # find(:xpath, "(//span[text()='Для парней'])[2]").click
            # find(ta(   'signature_updating:staff:forMan')).click
            find(:xpath, ta('signature_updating:staff:forMan', "(//span[text()='Для парней'])[2]")).click

            # User click on Polo and T-shirt
            # find(:xpath, "(//span[@class='menu-image-title'])[77]").click
            # find(ta(   'signature_updating:staff:poloAmdTshirts')).click
            find(:xpath, ta('signature_updating:staff:poloAmdTshirts', "(//span[@class='menu-image-title'])[77]")).click

            # User clicks for selecting staff
            # find(:xpath, "(//div[@class='nm-shop-loop-thumbnail nm-loader'])[4]").click
            # find(ta(   'signature_updating:staff:chooseStaff')).click
            find(:xpath, ta('signature_updating:staff:chooseStaff', "(//div[@class='nm-shop-loop-thumbnail nm-loader'])[4]")).click

            # User clicks for size selecting
            # find(:xpath, "(//ul[@class='variations'])[1]").select('XXL')
            # find(ta(   'signature_updating:staff:size')).select('XXL')
             find(:xpath, ta('signature_updating:staff:size', "(//ul[@class='variations'])[1]")).select('XXL')

            # User clicks for adding to cart
            # find(:xpath, "//span[@class='add_to_cart']").click
            # find(ta(   'signature_updating:staff:add_to_cart')).click
            find(:xpath, ta('signature_updating:staff:add_to_cart', "//span[@class='add_to_cart']")).click

            # User clicks for changing order in cart
            # find(:xpath, "//a[@class='button view-cart wc-forward']").click
            # find(ta(   'signature_updating:staff:changingBtn')).click
            find(:xpath, ta('signature_updating:staff:changingBtn', "//a[@class='button view-cart wc-forward']")).click

            # User clicks for changing order in cart
            # find(:xpath, "//input[@type='number']").set('0')
            # find(ta(   'signature_updating:staff:deleteOrder')).set('0')
            find(:xpath, ta('signature_updating:staff:deleteOrder', "//input[@type='number']")).set('0')

            # User clicks for changing order in cart
            # find(:xpath, "//input[@name='update_cart']").click
            # find(ta(   'signature_updating:staff:updateCart')).click
            find(:xpath, ta('signature_updating:staff:updateCart', "//input[@name='update_cart']")).click
            sleep 5
        end
    end
end
