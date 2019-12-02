When /^I go to the homepage$/ do
 visit "/"
end

When(/^(?:|I )press "([^\"]*)"(?: within "([^\"]*)")?$/) do |button, selector|
  with_scope(selector) do
    click_button(button)
  end
end

Given "We have one user at the moment" do
  User.create(email: "user1@example.com", password: "passwordA1") unless User.exists?(email: "user1@example.com")
end

When(/^I fill the authenticate information with "([^\"]*)" and "([^\"]*)"$/) do |first_field, second_field|
  step %{I fill in "user_email" with "#{first_field}"}
  step %{I fill in "user_password" with "#{second_field}"}
  step %{I press "Login / Register"}
end

Then("I should be on the videos page and {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, value|
  fill_in(arg1, with: value)
end
