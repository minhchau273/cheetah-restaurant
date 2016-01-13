@javascript
Feature: View menu
  I want to view menu items and sort the list of items
  
  Background:
    Given I am at Home page
    And There are 2 sections with some items in each section
    And I go to Menu page

  Scenario: View menu with each section
    Then I can see the the menu title
    And I can see 2 sections' names
    When I click "Lunch"
    Then I can see all menu items of Lunch section

  Scenario: Sort menu items by alphabet
    Then I can see the sort type is set Alphabetical by default
    Then I can see all items are sorted by alphabet

  Scenario: Sort menu items by price low to high
    When I click "dropdown-sort"
    And I click "Price Low To High"
    Then I can see all items are sorted by price low to high

  Scenario: Sort menu items by price high to low
    When I click "dropdown-sort"
    And I click "Price High To Low"
    Then I can see all items are sorted by price high to low
