require 'spec_helper'
feature 'TrueAutomation.IO capybara example' do
  scenario 'Annie Selke - Create account' do
    visit 'https://annieselke.com/'

    #click to close modal
    sleep 5
    within_frame(0) do
        page.execute_script("document.querySelector('button.close').click()")
    end

    sleep 3
    #find(:xpath, ta('annieselke:mainPage:loginDesktop', "//a[text()='Login']")).click
    #find(:xpath, "гl.header-link-items ").click
    find(ta(   'annieselke:mainPage:loginDesktop')).click

    #find(:xpath, ta('annieselke:mainPage:createAccount', "//h3[text()='Create an Account']")).click
    #find(:xpath, "//h3[text()='Create an Account']").click
    find(ta(   'annieselke:mainPage:createAccount')).click

    #find(:xpath, ta('annieselke:loginPage:firstName', "//input[@id='register.firstName']")).set('youre.example@gmail.com')
    #find(:xpath, "//input[@id='register.firstName']").set('youre.example@gmail.com')
    find(ta(   'annieselke:loginPage:firstName')).set('youre.example@gmail.com')

    #find(:xpath, ta('annieselke:loginPage:lastName', "//input[@id='register.lastName']")).set('name')
    #find(:xpath, "//input[@id='register.lastName']").set('name')
    find(ta(   'annieselke:loginPage:lastName')).set('name')

    #find(:xpath, ta('annieselke:loginPage:email', "//input[@id='register.email']")).set('name')
    #find(:xpath, "//input[@id='register.email']").set('name')
    find(ta(   'annieselke:loginPage:email')).set('name')

    #find(:xpath, ta('annieselke:loginPage:password', "//input[@id='password']")).set('1234tesT')
    #find(:xpath, "//input[@id='password']").set('1234tesT')
    find(ta(   'annieselke:loginPage:password')).set('1234tesT')

    #find(:xpath, ta('annieselke:loginPage:checkPwd', "//input[@id='register.checkPwd']")).set('1234tesT')
    #find(:xpath, "//input[@id='register.checkPwd']").set('1234tesT')
    find(ta(   'annieselke:loginPage:checkPwd')).set('1234tesT')

    #find(:xpath, ta('annieselke:loginPage:subscribe', "//label[@for='subscribe']")).click
    #find(:xpath, "//input[@id='subscribe']").click
    find(ta(   'annieselke:loginPage:subscribe')).click

    #find(:xpath, ta('annieselke:loginPage:register', "(//button[@class='primary actionSet'])[2]")).click
    #find(:xpath, "(//button[@class='primary actionSet'])[2]").click
    find(ta(   'annieselke:loginPage:register')).click

    sleep 5
  end
end
