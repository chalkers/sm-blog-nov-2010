@comments
Feature: Comment Management
  In order for people to leave comments on the site
  As a visitor
  I want to add a comment to a post

  Background:
    Given I am signed up and confirmed as "email@domain.com/password"
    And I have the following post records
      | title |
      | Ruby  |
    And I go to post list page
	
  Scenario: Add valid comment
    Given I follow "Ruby"
    When I fill in "Name" with "Andrew Chalkley"
    And I fill in "Email" with "andrew@chalkley.org"
    And I fill in "Website" with "http://andrew.chalkley.org"
    And I fill in "Comment" with "Cool Post!"
    And I press "Add Comment"
    Then I should see "1 comment"
    And I should see "Andrew Chalkley"
    And I should not see "andrew@chalkley.org"
    And I should not see "http://andrew.chalkley.org"
    And I should see "Cool Post!"

  Scenario: Attempt to leave an invalid comment (Empty Name and Comment, Invalid Email and Website)
    Given I follow "Ruby"
    When I fill in "Name" with ""
    And I fill in "Email" with "andrew@chalkley"
    And I fill in "Website" with "andrew.chalkley.org"
    And I fill in "Comment" with ""
    And I press "Add Comment"
    Then I should see "Name can't be blank"
    And I should see "Email is invalid"
    And I should see "Website is invalid"
    And I should see "Comment can't be blank"
		
  Scenario: Attempt to leave an invalid comment (Email empty)
    Given I follow "Ruby"
    When I fill in "Name" with "Andrew Chalkley"
    And I fill in "Email" with ""
    And I fill in "Website" with "http://andrew.chalkley.org"
    And I fill in "Comment" with "Hello World"
    And I press "Add Comment"
    Then I should see "Email can't be blank"

  Scenario: Delete comment if blog owner logged in
    Given I sign in as "email@domain.com/password"
    And I go to post list page
    And I follow "Ruby"
    When I fill in "Name" with "Andrew Chalkley"
    And I fill in "Email" with "andrew@chalkley.org"
    And I fill in "Website" with "http://andrew.chalkley.org"
    And I fill in "Comment" with "Cool Post!"
    And I press "Add Comment"
    Then I should see "1 comment"
    When I follow "Delete Comment"
    Then I should see "No comments"

  Scenario: Not logged in
    Given I should be signed out
    And I follow "Ruby"
    When I fill in "Name" with "Andrew Chalkley"
    And I fill in "Email" with "andrew@chalkley.org"
    And I fill in "Website" with "http://andrew.chalkley.org"
    And I fill in "Comment" with "Cool Post!"
    And I press "Add Comment"
    Then I should see "1 comment"
    And I should not see "Delete Comment"