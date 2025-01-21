*** Settings ***
Library    Browser
Library    JSONLibrary 
Resource   ../pages/login.resource
Resource   ../pages/products.resource 
Resource   ../pages/cart.resource
Resource   ../pages/checkout_step_one.resource
Resource   ../pages/checkout_step_two.resource
Resource   ../pages/checkout_complete.resource
Resource   ../commons.resource


*** Keywords ***
Given I login with a user
    [Arguments]    ${username}    ${password}
    Given I open the login page
    When I login with valid credentials  ${username}    ${password}
    Then I should see the products page

When I select an item for purchase and add it to the cart
    [Documentation]  Random product is a keyword that selects a random product from the list of products
    ...              defined in the resource file products
    Random product 
    When I add a product to the cart   ${PRODUCT_NAME}     ${PRODUCT_PRICE}

And go to the cart    
    When I go to my cart page with the product  ${PRODUCT_NAME}    ${PRODUCT_PRICE}

Then visit the checkout and complete the checkout process    
    Then I visit the checkout process   ${PRODUCT_NAME}     ${PRODUCT_PRICE} 
    And I complete the checkout process step one   
    And I complete the checkout process step two
    And I check the checkout complete page      