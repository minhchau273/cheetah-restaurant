@javascript
Feature: Contact us
  I want to view Contact us page

  Background:
    Given I am at Home page

  Scenario: View contact us page
    And I click "Contact Us"
    Then I can see the restaurant's address