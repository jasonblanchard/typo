Feature: Merge articles
  As an admin
  So that I can manage multiple authors writing about similar things
  I want to merge articles
  
  Background:
    Given the blog is set up
    Given the following users exist:
    | login | email             | name | password | profile_id |
    | jason | jason@example.com | jason| secret   | 2          |
    | bob   | bob@example.com   | bob  |          | 3          |

    Given the following articles exist:
    | title      | author | body              | published_at        | state     | type    |
    | Batman     | jason  | Post about batman | 2012-11-14 16:01:00 | published | Article |
    | Robin      | bob    | Post about robin  | 2012-10-14 16:01:00 | published | Article |
    
  Scenario: Admins can merge two articles
    Given I am logged into the admin panel
    And I am on the edit article page for "Batman"
    When I fill in "merge_with" with the title of similar article "Robin"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Batman"
    When I follow "Batman"
    Then I should see content from "Batman" and "Post about robin"
    And The author of "Batman" should be "jason"

  Scenario: Non-admins cannot merge two articles
    Given I am logged in as "jason"
    And I am on the "merge article" page for "Batman" and "Robin"
    Then I should be on the admin page
