Feature: User login or Register
  As a new user
  I want to create an account and sign in by entering the username and password for the first time.

  @javascript
  Scenario: Register new user
    when I go to the homepage
    And I fill the authenticate information with "user2@example.com" and "passwordA2"
    Then I should be on the videos page and "Welcome user2@example.com"