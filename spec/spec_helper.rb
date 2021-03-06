require 'bundler/setup'
require 'ostruct'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-steps'
require 'capybara/rspec'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'


def camelize(str)
  str.split('_').map {|w| w.capitalize}.join
end

spec_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(spec_dir)

$data = {}
Dir[File.join(spec_dir, 'fixtures/**/*.yml')].each {|f|
  title = File.basename(f, '.yml')
  $data[title] = OpenStruct.new(YAML::load(File.open(f)))
}

$data = OpenStruct.new($data)
Dir[File.join(spec_dir, 'support/**/*.rb')].each {|f| require f}

# RSpec.configure do |config|
#
#   Capybara.register_driver :true_automation_driver do |app|
#      # profile = Selenium::WebDriver::Chrome::Profile.new
#       #client = Selenium::WebDriver::Remote::Http::Default.new
#       #client.timeout = 300 # instead of the default 60
#     TrueAutomation::Driver::Capybara.new(app)
#     #Capybara::Selenium::Driver.new(app, browser: :chrome)
#
#   end
RSpec.configure do |config|
  $caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
  $caps_chrome['chromeOptions'] = {}
  $caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
  # $caps_chrome['chromeOptions']['mobileEmulation'] = {'deviceName' => 'iPhone X'}
  # p $caps_chrome

  Capybara.register_driver :true_automation_driver do |app|
    TrueAutomation::Driver::Capybara.new(app, desired_capabilities: $caps_chrome,
    #          driver_opts: {
    #     log_path: "chrome#{Time.now.to_i}.log",
    #     verbose: true
    # }
    )
end



  Capybara.configure do |capybara|
    capybara.run_server = false
    capybara.default_max_wait_time = 20

    capybara.default_driver = :true_automation_driver
  end

  config.include Capybara::DSL
  config.include TrueAutomation::DSL

  Dir[File.join(spec_dir, 'support/**/*.rb')].each {|f|
    base = File.basename(f, '.rb')
    klass = camelize(base)
    config.include Module.const_get(klass)
  }
end




# ============== FOR
# ============== no_TA
#
# require 'bundler/setup'
# require 'ostruct'
# require 'selenium-webdriver'
# require 'rspec'
# require 'rspec-steps'
# require 'capybara/rspec'
# # require 'true_automation/rspec'
# # require 'true_automation/driver/capybara'
#
# def camelize(str)
#   str.split('_').map {|w| w.capitalize}.join
# end
#
# spec_dir = File.dirname(__FILE__)
# $LOAD_PATH.unshift(spec_dir)
#
# $data = {}
# Dir[File.join(spec_dir, 'fixtures/**/*.yml')].each {|f|
#   title = File.basename(f, '.yml')
#   $data[title] = OpenStruct.new(YAML::load(File.open(f)))
# }
#
# $data = OpenStruct.new($data)
# Dir[File.join(spec_dir, 'support/**/*.rb')].each {|f| require f}
#
# RSpec.configure do |config|
#   # Capybara.register_driver :true_automation_driver do |app|
#   #   TrueAutomation::Driver::Capybara.new(app)
#   # end
#   $caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
#   $caps_chrome['chromeOptions'] = {}
#   $caps_chrome['chromeOptions']['args'] = ['--disable-notifications']
#
#   Capybara.register_driver :chrome do |app|
#     Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: $caps_chrome,)
#   end
#
#   Capybara.configure do |capybara|
#     capybara.run_server = false
#     capybara.default_max_wait_time = 5
#
#     # capybara.default_driver = :true_automation_driver
#     capybara.default_driver = :chrome
#   end
#
#   config.include Capybara::DSL
#   # config.include TrueAutomation::DSL
#
#   Dir[File.join(spec_dir, 'support/**/*.rb')].each {|f|
#     base = File.basename(f, '.rb')
#     klass = camelize(base)
#     config.include Module.const_get(klass)
#   }
# end                              