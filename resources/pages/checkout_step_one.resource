*** Settings ***
Library    Browser
Library    Collections
Library    FakerLibrary      locale=en_US
Resource   ../locators/products_elements.resource
Resource   ../locators/cart_elements.resource
Resource   ../locators/checkout_step_one_elements.resource
Resource   ../locators/checkout_step_two_elements.resource
Resource   ../commons.resource

*** Variables ***
${CHECKOUT_STEP_ONE_MSG}    Checkout: Overview 

*** Keywords ***
And I complete the checkout process step one
    Input checkout information
    Click    ${continue_button_element}  

    Wait For Elements State     ${title_checkout_step_two_element}              timeout=${DEFAULT_TIMEOUT_ELEMENT} 
    ${actual_text_title_confirmation}     Get Text                              ${title_checkout_step_two_element} 
    Should Be Equal As Strings            ${actual_text_title_confirmation}     ${CHECKOUT_STEP_ONE_MSG}

Input checkout information
    ${first_name}    FakerLibrary.First Name
    ${last_name}     FakerLibrary.Last Name
    ${postal_code}   FakerLibrary.Zipcode

    Type Text    ${first_name_input_element}    ${first_name}
    Type Text    ${last_name_input_element}     ${last_name}
    Type Text    ${postal_code_input_element}   ${postal_code}