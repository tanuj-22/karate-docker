@dev
Feature: Karate Test Example

  Scenario: Verify addition of two numbers
    Given a variable x with value 5
    And a variable y with value 10
    When I add x and y
    Then the result should be 15



