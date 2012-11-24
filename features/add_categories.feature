Feature: Adding categories
  As an admin
  So that I can organize articles
  I want to add and edit categories

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

    Scenario: Admins can add new categories
      Given I am logged into the admin panel
      And I am on the category admin page
      Then I should see the form for "Categories"

