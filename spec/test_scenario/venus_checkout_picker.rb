require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'venus' do
    visit 'https://venus.com/'

    find(:xpath, ta('venus:picker:clothing')).hover
    find(:xpath, ta('venus:picker:dress')).click
    find(:xpath, ta('venus:picker:firstdress')).click
    find(:xpath, ta('venus:picker:size')).click
    find(:xpath, ta('venus:picker:addtobagbutton')).click
    find(:xpath, ta('venus:picker:gotocheckout')).click

    sleep 5
  end
end
