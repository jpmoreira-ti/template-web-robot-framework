*** Settings ***
Resource   ../locators/login_elements.resource
Resource   ../locators/products_elements.resource
Resource   ../setup.resource
Resource   ../commons.resource

*** Variables ***
${TITLE_PAGE}         Swag Labs
${PRODUCTS_PAGE}      Products

*** Keywords ***
Given I open the login page
    ${title}    Get Title
    Should Be Equal As Strings   ${title}    ${TITLE_PAGE}

When I login with valid credentials
    [Arguments]       ${username}    ${password}

    Wait For Elements State     ${login_username_element}    timeout=${DEFAULT_TIMEOUT_ELEMENT}
    Type Text                   ${login_username_element}    ${username}

    Wait For Elements State     ${login_password_element}    timeout=${DEFAULT_TIMEOUT_ELEMENT}
    Type Text        ${login_password_element}    ${password}
    
    Click     ${login_button_element}

When I login with invalid credentials
    [Arguments]       ${username}    ${password}

    When I login with valid credentials  ${username}    ${password}

Then I should see the products page
    Wait For Elements State       ${title_products_element}    timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${title_products_text}        Get Text                     ${title_products_element}
 
    Should Be Equal As Strings    ${title_products_text}       ${PRODUCTS_PAGE} 

Then I should see the login error message on the screen
    [Arguments]                       ${expected_alert_message_text}

    Wait For Elements State           ${login_error_message_element}   timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_alert_message_text}      Get Text                         ${login_error_message_element}

    Should Be Equal As Strings        ${actual_alert_message_text}     ${expected_alert_message_text} 