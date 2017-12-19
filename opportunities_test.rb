When /^I am on the "([^"]*)" Application as a "([^"]*)"$/ do |application, user|

     step %{I am logged in as "#{user}" user}
     App.power_nap(App::MIN_SLEEP)
     step %{I click on app_launcher icon}
     App.power_nap(App::MIN_SLEEP)
     step %{I click on "#{application}"}
end

And /^I am on the Opportunities homepage$/ do
  step %{I click on app_launcher icon}
  on(Opportunities_testPage).text_tag("search_module","Opportunities")
  App.power_nap(App::MIN_SLEEP)
  step %{I am on Opportunities screen}
  App.power_nap(App::MEDIUM_SLEEP)

end

When /^I go to one of the available opportunities$/ do

  on(Opportunities_testPage).link_tag("link_to_view_Automation_test_Opportunities")
  App.power_nap(App::MEDIUM_SLEEP)
  on(Opportunities_testPage).input_tag("automation_test_opportunities")
  App.power_nap(App::MEDIUM_SLEEP)
  on(Opportunities_testPage).link_tag("select_record")
end

And /^I go to the Related List$/ do
  App.power_nap(App::MEDIUM_SLEEP)
  on(Opportunities_testPage).link_tag("related")
  App.power_nap(App::MEDIUM_SLEEP)
end

Then /^The File related list should be displayed$/ do
  App.power_nap(App::MEDIUM_SLEEP)
  String fileCount = on(Opportunities_testPage).get_text("no_of_files")
  puts "Number of files:#{fileCount[/\d+/].to_i}"

end