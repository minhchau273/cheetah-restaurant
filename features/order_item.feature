@javascript
Feature: View menu
  I want to order an item
  
  Background:
    Given I am at Home page
    And There are 2 sections with some items in each section
    And I go to Menu page

  Scenario: Order successfully
    When I choose Order an item
    Then I can see Order page
    When I input name
    And I click "Submit Order"
    Then I can see sucessful message

  Scenario: Fail to order
    When I choose Order an item
    Then I can see Order page
    When I click "Submit Order"
    Then I can see error message
