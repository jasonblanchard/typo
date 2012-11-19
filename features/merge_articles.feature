Feature: Merge articles
  As an admin
  So that I can manage multiple authors writing about similar things
  I want to merge articles
  
  Background:
    Given the blog is set up
    Given the following users exist:
    | login | email             | name |
    | jason | jason@example.com | jason|
    | bob   | bob@example.com   | bob  |

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
    Then I should see content from "Batman" and "Robin"
    And The author of "Batman" should be "jason"
