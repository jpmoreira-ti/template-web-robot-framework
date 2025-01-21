*** Settings ***
Resource         ../../resources/pages/login.resource
Resource         ../../resources/pages/purchase_flow.resource
Resource         ../../resources/pages/products.resource
Resource         ../../resources/commons.resource
Resource         ../../resources/setup.resource

Suite Setup      Setup Browser 
Suite Teardown   TearDown Browser
Test Teardown    Take screenshot testing
Test Tags        purchase_flow


*** Test Cases ***
Purchase Successfully
    [Documentation]  USER_DEFAULT and PASSWORD_DEFAULT are defined in the resource file commons
    Given I login with a user   ${USER_DEFAULT}   ${PASSWORD_DEFAULT}
    When I select an item for purchase and add it to the cart 
    And Go to the cart 
    Then visit the checkout and complete the checkout process 
