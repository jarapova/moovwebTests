require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'venus' do
    visit 'https://venus.com/'

    find(ta('venus:picker:clothing')).hover
    find(ta('venus:picker:dress')).click
    find(ta('venus:picker:firstdress')).click
    find(ta('venus:picker:size')).click
    find(ta('venus:picker:addtobagbutton')).click
    find(ta('venus:picker:gotocheckout')).click
  end
end
