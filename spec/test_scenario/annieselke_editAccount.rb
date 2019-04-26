require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - edit account' do
    visit 'https://annieselke.com/login'

    #click to close modal
    sleep 5
    within_frame(0) do
        page.execute_script("document.querySelector('button.close').click()")
    end

    sleep 3
    #enter email
    #find(:xpath, ta('annieselke:loginPage:signInEmail', "//input[@id='j_username']")).set('julia.arapova@softesis.com')
    #find(:xpath, "//input[@id='j_username']").set('julia.arapova@softesis.com')
    find(ta(   'annieselke:loginPage:signInEmail')).set('julia.arapova@softesis.com')

    #enter password
    #find(:xpath, ta('annieselke:loginPage:pass', "//input[@id='j_password']")).set('1234tesT')
    #find(:xpath, "//input[@id='j_password']").set('1234tesT')
    find(ta(   'annieselke:loginPage:pass')).set('1234tesT')

    sleep 5
    #click on login btn
    #find(:xpath, ta('annieselke:loginPage:loginBtn', "//button[text()='Login']")).click
    #find(:xpath, "//button[text()='Login']").click
    find(ta(   'annieselke:loginPage:loginBtn')).click

    #click on My Account to enter
    # find(:xpath, (ta'annieselke:loginPage:myAccountDesktop', "//li/a[text()='My Account']")).click
    #find(:xpath, "//li/a[text()='My Account']").click
    find(ta(   'annieselke:loginPage:myAccountDesktop')).click

    #click 'Update personal details' on My Profile
    #find(:xpath, ta('annieselke:loginPage:profileEditDesktop', "(//div[@class='account-tile-links']/ul/li[1])[1]")).click
    #find(:xpath, "(//div[@class='account-tile-links']/ul/li[1])[1]").click
    find(ta(   'annieselke:loginPage:profileEditDesktop')).click

    #change title
    #find(:xpath, "//select[@id='profile.title']").select('Ms')
    #find(:xpath, ta('annieselke:accountPage:profileTitle', "//select[@id='profile.title']")).select('Ms')
    find(ta(   'annieselke:accountPage:profileTitle')).select('Ms')

    #click save updates
    #find(:xpath, ta('annieselke:loginPage:saveUpdates', "//button[text()='Save Updates']")).click
    #find(:xpath, "//button[text()='Save Updates']").click
    find(ta(   'annieselke:loginPage:saveUpdates')).click
    sleep 5
  end
end
