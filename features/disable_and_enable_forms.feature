Feature: Disable and enable forms
  In order to customise the view
  As an admin user
  wants to be able to enable and disable particular forms

  Background:
    Given the following form sections exist in the system:
      | name              | unique_id         |  order | enabled | perm_enabled |
      | Basic details     | basic_details     |  1     | true    | true         |
      | Caregiver details | caregiver_details |  2     | false   | false        |
      | Child details     | child_details     |  3     | true    | false        |

  Scenario: Register new disable_and_enable_forms
    Given I am logged in as an admin
    And I am on the form section page
    When I check "sections_caregiver_details"
    Then the checkbox with id "sections_caregiver_details" should not be checked

  Scenario: Should enable selected forms
    Given I am logged in as an admin
    And I am on the form section page
    Then I should see the text "Hidden" in the enabled column for the form section "caregiver_details"
    And the "caregiver_details" section should not have order controls
    And the "caregiver_details" section should not have an order number
    When I check "sections_caregiver_details"
    And I press "Show"
    Then I should see the text "Visible" in the enabled column for the form section "caregiver_details"
    And the checkbox with id "sections_caregiver_details" should not be checked

  Scenario: Permanently enabled sections
    Given I am logged in as an admin
    When I am on the form section page
    Then the "basic_details" section should not have order controls
    And the "basic_details" section should have an order number


