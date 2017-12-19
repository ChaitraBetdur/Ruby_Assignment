And /^I click on app_launcher icon$/ do
  App.power_nap(App::MIN_SLEEP)
  on(NavigationPage).input_tag('app_launcher')
  App.power_nap(App::MIN_SLEEP)
end

And /^I click on "([^"]*)"$/ do |console_type|
  sleep 5
  #@browser.body.div(:class => ['appTileTitle'],:text => "FG Sales Lightning").click if @browser.body.div(:class => ['appTileTitle'],:text => "FG Sales Lightning").wait_until_present
  on(NavigationPage).input_tag("#{console_type}")
end

Then /^I should see title as"([^"]*)"$/ do |title_type|
  App.power_nap(App::MIN_SLEEP)
  puts on(NavigationPage).get_text(title_type)
end