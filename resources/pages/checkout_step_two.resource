*** Settings ***
Library    Browser
Library    Collections
Library    FakerLibrary      locale=en_US    
Resource   ../locators/products_elements.resource
Resource   ../locators/cart_elements.resource
Resource   ../commons.resource
Resource   ../locators/checkout_step_two_elements.resource
Resource   ../locators/checkout_complete_elements.resource

*** Variables ***
${CHECKOUT_STEP_TWO_MSG}   Checkout: Complete! 


*** Keywords ***
And I complete the checkout process step two
    Wait For Elements State    ${payment_info_label_element}        timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_payment_info_label}      Get Text                 ${payment_info_label_element}
    Should Not Be Empty        ${actual_text_payment_info_label}    msg=The payment information is empty 

    Wait For Elements State    ${shipping_info_label_element}       timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_shipping_info_label}      Get Text                ${shipping_info_label_element}
    Should Not Be Empty        ${actual_text_shipping_info_label}   msg=The shipping information is empty 

    Wait For Elements State    ${total_info_label_element}          timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_total_info_label}      Get Text                   ${total_info_label_element} 
    Should Not Be Empty        ${actual_text_total_info_label}      msg=The total information is empty

    Wait For Elements State    ${subtotal_label_element}            timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_subtotal_label}      Get Text                     ${subtotal_label_element}
    Should Not Be Empty        ${actual_text_subtotal_label}        msg=The subtotal information is empty

    Wait For Elements State    ${tax_label_element}                 timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_tax_label}    Get Text                            ${tax_label_element}
    Should Not Be Empty        ${actual_text_tax_label}             msg=The tax information is empty 

    Wait For Elements State    ${total_label_element}               timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_total_label}      Get Text                             ${total_label_element}
    Should Not Be Empty        ${actual_total_label}                msg=The total information is empty

    ${subtotal_converted}      Evaluate                             float('${actual_text_subtotal_label}'.replace('Item total: $', ''))
    ${tax_converted}           Evaluate                             float('${actual_text_tax_label}'.replace('Tax: $', ''))
    ${total_converted}         Evaluate                             float('${actual_total_label}'.replace('Total: $', ''))

    ${expected_total}          Evaluate                             ${subtotal_converted} + ${tax_converted}
    Should Be Equal As Numbers      ${total_converted}    ${expected_total}
    ...    msg=The total calculation is incorrect   precision=2   

    Click    ${finish_button_element}

    Wait For Elements State     ${title_checkout_complete_element}  timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_title_confirmation}      Get Text                 ${title_checkout_complete_element}

    Should Be Equal As Strings       ${actual_text_title_confirmation}      ${CHECKOUT_STEP_TWO_MSG}  
