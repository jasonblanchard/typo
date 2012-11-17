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
    | id | title | author | body         | published_at        | state |
    | 10 | Foo   | jason  | This is foo  | 2012-11-14 16:01:00 | published |
    | 11 | Bar   | bob    | This is bar  | 2012-10-14 16:01:00 | published |

  Scenario: Merge two articles
    Given I am logged into the admin panel
    And I am on the edit article page for "Foo"
    When I fill in "merge_with" with "11"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foo"
    When I follow "Foo"
    Then I should see content from "Foo" and "Bar"
    And The author of "Foo" should be "jason"

