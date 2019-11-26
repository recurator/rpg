Feature: Users
  The application should allow users to signup and signin using email and password.

  Scenario: User can create account
    Given no current user
    When I am on the "/signup" page
    Then I should see "Signup"
    And I fill in "email" with "jabre@example.net"
    And I fill in "username" with "jabre"
    And I fill in "password" with "secret"
    And I fill in "password_confirmation" with "secret"
    And I press "Signup"
    Then I should be redirected to "/"
    And I should see "Signed up successfully"

  Scenario: User is not signed in
    Given no current user
    When I access a page
    Then the signin form should be shown
    And I should not be authorized

  Scenario: User enters wrong password
    Given a registered user with the email "jabre@example.net" with password "secret" exists
    And I am on the "/signin" page
    When I fill in "email" with "jabre@exmaple.net"
    And I fill in "password" with "wrong_password"
    And I press "Signin"
    Then the signin form should be shown
    And I should see "Wrong email or password"
    And I should not be signed in

  Scenario: User is registered and enters correct email and password
    Given a registered user with the email "jabre@example.net" with password "secret" exists
    And I am on the "/signin" page
    When I fill in "email" with "jabre@example.net"
    And I fill in "password" with "secret"
    And I press "Signin"
    Then I should be redirected to "/"
    And I should see "Signed in successfully"
    And I should be signed in

