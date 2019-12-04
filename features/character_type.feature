Feature: Character Type
  Signed in user should create a new game character type.

  Scenario: Signed out user can not access new character type page
    Given no current user
    When I am on the "/character_types/new" page
    Then I should see "Log in"

  Scenario: Signed in user can create new character type
    Given  User "jabre" is logged in
    And I am on the "/character_types/new" page
    Then I should see "New Character Type"
    And I fill in "character_type_name" with "Druid"
    And I attach a avatar to character type
    And I fill in "character_type_character_attributes_attributes_0_name" with "Mana"
    And I fill in "character_type_character_attributes_attributes_0_value" with "100"
    And I attach a icon to character attribute
    When I press "Create"
    Then I should see "Character type was successfully created."
    And I should see "Druid"
    And I should see "Mana"

  Scenario: Signed in user can not create character type if that character type already exists
    Given User "sauron" created character type "Druid"
    And User "jabre" is logged in
    When I am on the "/character_types/new" page
    Then I should see "New Character Type"
    And I fill in "character_type_name" with "Druid"
    And I attach a avatar to character type
    When I press "Create"
    Then I should see "Name has already been taken"

  Scenario: Signed in user can see only his own character types
    Given User "sauron" created character type "Warlock"
    And User "jabre" created character type "Druid"
    And User "jabre" is logged in
    When I am on the "/character_types" page
    Then I should see "Character Types"
    And I should see "Druid"
    And I should not see "Warlock"

  Scenario: Signed in user can delete his character types
    Given User "jabre" created character type "Druid"
    And User "jabre" is logged in
    When I am on the "/character_types" page
    Then I should see "Destroy"
    When I follow "Destroy"
    Then I should see "Character type was successfully destroyed."
