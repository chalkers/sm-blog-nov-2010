@seo
Feature: SEO Friendly URLs
  In order to optimise the blog for SEO
  As a blog owner
  I want nice urls

  Background:
    Given I have the following post records
      | title                            |
      | Ruby on Rails                    |
      | Ruby                             |
      | My Name's Andrew Parker-Chalkley |
      | __FILE__ Location                |
      | "Hello World"                    |

  Scenario Outline: Visiting an article
    Given I am on post list page
    When I follow "<post>"
    Then I the url should end in <url_ending>
		
  Examples:
    | post                             | url_ending                      |
    | Ruby on Rails                    | ruby-on-rails                   |
    | Ruby                             | ruby                            |
    | My Name's Andrew Parker-Chalkley | my-names-andrew-parker-chalkley |
    | __FILE__ Location                | file-location                   |
    | "Hello World"                    | hello-world                     |