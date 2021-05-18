*** Settings ***

Resource          ../resources/commom.resource.robot
#Test Setup        Abrir Navegador
#Test Teardown     Close Browser

*** Test Cases ***
Scenario: Valid Login
    [Test Setup]
    Given Abrir Navegador
    And I'm access to browser to login page
    When I Input Username     ${USER1}
    And I Input Password     ${password}
    Then Submit Credentials
   
Scenario: Sellect all T-shirt
    Given I selected product   
    When I click on Cart
   # Then All T-shirts have been added to the cart

#Scenario: Buy all T-shirts
 #  Given That I'm on the Cart Page
  # When Check all products
  # And I click on "Checkout" Button
   #Then I fill my information and finished of the order

#Scenario: Sort products on the home page
 # Given I'm on the Home Page
  #When I select products    ${all-products}
 # And I sort the products
  #Then The products are ordered from A-Z