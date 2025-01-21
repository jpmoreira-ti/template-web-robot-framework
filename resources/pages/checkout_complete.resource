*** Settings ***
Library    Browser
Resource   ../commons.resource
Resource   ../locators/checkout_complete_elements.resource

*** Variables ***
${CHECKOUT_COMPLETE_MSG}     Thank you for your order!
${CHECKOUT_BACK_HOME_MSG}    Back Home

*** Keywords ***
And I check the checkout complete page 
    Wait For Elements State     ${complete_header_text_element}              timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_title_confirmation}      Get Text                          ${complete_header_text_element}
    Should Be Equal As Strings       ${actual_text_title_confirmation}       ${CHECKOUT_COMPLETE_MSG}

    Wait For Elements State     ${button_back_element}                       timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_title_confirmation}      Get Text                          ${button_back_element}
    Should Be Equal As Strings       ${actual_text_title_confirmation}       ${CHECKOUT_BACK_HOME_MSG}
