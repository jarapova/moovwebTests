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
  scenario 'Annie Selke - Homepage contains expected content' do
    visit 'https://annieselke.com/'

    carusel = "(//span[@class='moov-mobile-hp position-1'])[1]"
    rugs = "//span[text()='Rugs']"

      p "I am expect carusel in hesder"
      expect(page).to have_selector(:xpath, carusel)
      p 'I see carusel in header'
      find(:xpath, ta("annieselke:mainPage:rugsButton", rugs)).click
      p "Account icon clicked"

    sleep 5
    end
  end
end
