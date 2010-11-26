Feature: Sign up
  In order to get protect sections of the site
  A none authors
  Shouldn't be able to sign up

  Scenario: Users cannot sign up
    When I go to the sign up page
    Then I should see "You cannot sign up"
    And I should be on the homepage