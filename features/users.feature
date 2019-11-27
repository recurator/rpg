Feature: Users
  The application should allow users to signup and signin using email and password.

  Scenario: User can create account
    Given no current user
    When I am on the "/users/sign_up" page
    Then I should see "Sign up"
    And I fill in "user_email" with "jabre@example.net"
    And I fill in "user_username" with "jabre"
    And I fill in "user_password" with "secret"
    And I fill in "user_password_confirmation" with "secret"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

  Scenario: User enters wrong password
    Given a registered user with the email "jabre@example.net" with password "secret" exists
    And I am on the "/users/sign_in" page
    And I should see "Log in"
    When I fill in "user_email" with "jabre@exmaple.net"
    And I fill in "user_password" with "wrong_password"
    And I press "Log in"
    Then I should see "Invalid Email or password"

  Scenario: User is registered and enters correct email and password
    Given a registered user with the email "jabre@example.net" with password "secret" exists
    And I am on the "/users/sign_in" page
    Then I should see "Log in"
    When I fill in "user_email" with "jabre@example.net"
    And I fill in "user_password" with "secret"
    And I press "Log in"
    And I should see "Signed in successfully"
