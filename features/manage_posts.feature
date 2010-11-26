@posts
Feature: Manage posts
  In order to write a blog
  As an author
  I want to manage blog posts

  Background:
    Given I am signed up and confirmed as "email@domain.com/password"
	    

  Scenario: Create a new post
    Given I sign in as "email@domain.com/password"
    And I am on the new post page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Create Post"
    Then I should see "title 1"
    And I should see "body 1"

  Scenario: Attempt to create an invalid post
    Given I sign in as "email@domain.com/password"
    And I am on the new post page
    When I fill in "Title" with ""
    And I fill in "Body" with ""
    And I press "Create Post"
    Then I should see "Title can't be blank"
    And I should see "Body can't be blank"

  Scenario: Create a new draft post
    Given I sign in as "email@domain.com/password"
    And I am on the new post page
    When I fill in "Title" with "draft title 1"
    And I fill in "Body" with "draft body 1"
    And I uncheck "Published"
    And I press "Create Post"
    Then I should see "draft title 1"
    And I should see "draft body 1"
    When I go to post list page
    Then I should see "draft title 1"
    And I should see "draft body 1"
    When I follow "Sign out"
    And I go to post list page
    Then I should not see "draft title 1"
    And I should not see "draft body 1"

  Scenario Outline: Visit various post pages when not logged in
    Given  I go to the post list page
    And I should be signed out
    When I go to the <location>
    Then I should be on the sign in page
  Examples:
    | location       |
    | new post page  |
    | edit post page |

  Scenario: Delete post
    Given I sign in as "email@domain.com/password"
    And I have the following post records
      | title   | body   |
      | title 1 | body 1 |
      | title 2 | body 2 |
      | title 3 | body 3 |
      | title 4 | body 4 |
    Then I go to post list page
    And I should see "Delete Post"
    When I delete the 3rd post
    Then I should see the following posts:
      | title   | body   |
      | title 1 | body 1 |
      | title 2 | body 2 |
      | title 4 | body 4 |

  Scenario: List Blog Articles
    Given I have the following post records
      | title |
      | Ruby  |
      | Rails |
      | BDD   |
    When I go to post list page
    And I should be signed out
    Then I should see "Ruby"
    And I should see "Rails"
    And I should see "BDD"
    And I should not see "New Post"
    And I should not see "Edit Post"
    And I should not see "Delete Post"
    When I follow "Rails"
    Then I should not see "Edit Post"

  Scenario: Edit a new post
    Given I sign in as "email@domain.com/password"
    And I have the following post records
      | title | body	|
      | Ruby  | Ruby body|
    When I go to post list page
    And I follow "Edit Post"
    And I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Update Post"
    Then I should see "title 1"
    And I should see "body 1"
    And I should not see "Ruby"
    And I should not see "Ruby body"
    And I should see "Edit Post"
  		
  Scenario Outline: Pagination
    Given I go to post list page
    And  I add 20 published posts
    And I add 10 draft posts
    And <logged_in>
    When I go to post list page
    Then I should see "<see>"
  Examples:
    | logged_in                                | see                 |
    | I should be signed out                   | Previous 1 2 Next   |
    | I sign in as "email@domain.com/password" | Previous 1 2 3 Next |
