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
            visit 'https://www.facebook.com'

            # User clicks on the email input for setting email
            # find(:xpath, "//input[@name='email']").set('eshapovalov298@gmail.com')
            # find(ta(   'signature_updating:mobFb:email')).set('eshapovalov298@gmail.com')
            find(:xpath, ta('signature_updating:mobFb:email', "//input[@name='email']")).set('eshapovalov298@gmail.com')

            # User clicks on the pass input for setting pass
            # find(:xpath,"//input[@name='pass']").set('Tester1234')
            # find(ta(   'signature_updating:mobFb:pass')).set('Tester1234')
            find(:xpath, ta('signature_updating:mobFb:pass', "//input[@name='pass']")).set('Tester1234')

            # User clicks on the login button for entering into account
            # find(:xpath, "//button[@name='login']").click
            # find(ta(   'signature_updating:mobFb:loginbtn')).click
            find(:xpath, ta('signature_updating:mobFb:loginbtn', "//button[@name='login']")).click

            # User clicks OK button
            # find(:xpath, "//button[@value='OK']").click
            # find(ta(   'signature_updating:mobFb:okBtn')).click
            find(:xpath, ta('signature_updating:mobFb:okBtn', "//button[@value='OK']")).click

            # User clicks in div for creating new post
            # find(:xpath, "//div[@id='MComposer']").click
            # find(ta(   'signature_updating:mobFb:newpost')).click
            find(:xpath,  ta('signature_updating:mobFb:newpost', "//div[@id='MComposer']")).click

            # User set text
            # find(:xpath, "//textarea[@class='composerInput mentions-input']").set('ololo')
            # find(ta(   'signature_updating:mobFb:setText')).set('ololo')
            find(:xpath,  ta('signature_updating:mobFb:setText', "//textarea[@class='composerInput mentions-input']")).set('ololo')

            # User clicks on Post button for publishing
            # find(:xpath, "//button[@value='Post']").click
            # find(ta(   'signature_updating:mobFb:post')).click
            find(:xpath,  ta('signature_updating:mobFb:post', "//button[@value='Post']")).click

            # Waiting for publishing
            expect(page).to have_text("Your post is now published")
            expect(page).to have_no_text("Your post is now published")

            # User clicks on multiMenu for selecting setting of new post
            # find(:xpath, "(//div[@data-sigil='story-popup-causal-init'])[1]").click
            # find(ta(   'signature_updating:mobFb:multiMenu')).click
            find(:xpath,  ta('signature_updating:mobFb:multiMenu', "(//div[@data-sigil='story-popup-causal-init'])[1]")).click

            # User clicks Delete post
            # find(:xpath, "//a[@data-sigil='touchable touchable removeStoryButton enabled_action']").click
            # find(ta(   'signature_updating:mobFb:deletePost')).click
            find(:xpath,  ta('signature_updating:mobFb:deletePost', "//a[@data-sigil='touchable touchable removeStoryButton enabled_action']")).click

            # User is confirms deleting post
            # find(:xpath,   "//a[@title='Delete']").click
            # find(ta(   'signature_updating:mobFb:acceptDelete')).click
            find(:xpath,  ta('signature_updating:mobFb:acceptDelete', "//a[@title='Delete']")).click
            sleep 3
        end
    end
end
