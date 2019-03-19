require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - edit account' do
    visit 'https://annieselke.com/'

    sleep 10
    #go to stage site and click  to close modal
    within_frame('fcopt-offer-66236-content') do
        find(:xpath, "//button[@class='offer-control close']").click
    end

    sleep 3

    #click on login link,  it's on the left top page
    #find(:xpath, ta('annieselke:mainPage:login', "//a[text()='Login']")).click
    #find(:xpath, "гl.header-link-items ").click
    find(:xpath, ta('annieselke:mainPage:login')).click

    #enter email
    #find(:xpath, ta('annieselke:loginPage:signInEmail', "//input[@id='j_username']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='j_username']").set('julia.arapova@softesis.com')
    find(:xpath, ta('annieselke:loginPage:signInEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('annieselke:loginPage:pass', "//input[@id='j_password']")).set('1234tesT')
    #find(:xpath, "//input[@id='j_password']").set('1234tesT')
    find(:xpath, ta('annieselke:loginPage:pass')).set('1234tesT')

    #click on login btn
    #find(:xpath, ta('annieselke:loginPage:loginBtn', "//button[text()='Login']")).click
    #find(:xpath, "//button[text()='Login']").click
    find(:xpath, ta('annieselke:loginPage:loginBtn')).click

    #click on My Account to enter
    #find(:xpath, (ta'annieselke:loginPage:myAccount', "//li/a[text()='My Account']")).click
    #find(:xpath, "//li/a[text()='My Account']").click
    find(:xpath, ta('annieselke:loginPage:myAccount')).click

    #click 'Update personal details' on My Profile
    #find(:xpath, ta('annieselke:loginPage:profileEdit', "(//div[@class='account-tile-links']/ul/li[1])[1]")).click
    #find(:xpath, "(//div[@class='account-tile-links']/ul/li[1])[1]").click
    find(:xpath, ta('annieselke:loginPage:profileEdit')).click

    #change title
    #find(:xpath, "//select[@id='profile.title']").select('Ms')
    #find(:xpath, ta('annieselke:accountPage:profileTitle', "//select[@id='profile.title']")).select('Ms')
    find(:xpath, ta('annieselke:accountPage:profileTitle')).select('Ms')

    #click save updates
    #find(:xpath, ta('annieselke:loginPage:saveUpdates', "//button[text()='Save Updates']")).click
    #find(:xpath, "//button[text()='Save Updates']").click
    find(:xpath, ta('annieselke:loginPage:saveUpdates')).click
    sleep 5
  end
end
