*** Settings ***
Library    Browser
Library    Collections  
Resource   ../locators/products_elements.resource  
Resource   ../locators/cart_elements.resource
Resource   ../locators/checkout_step_one_elements.resource
Resource   ../commons.resource


*** Keywords ***
Then I visit the checkout process 
    [Arguments]   ${item_name}    ${item_price}
    Click add cart button after checking product   ${item_name}    ${item_price}  

    Wait For Elements State     ${title_checkout_step_one_element}       timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_title_checkout}      Get Text                  ${title_checkout_step_one_element} 
    Should Be Equal as Strings          ${actual_text_title_checkout}    Checkout: Your Information


Click add cart button after checking product
    [Arguments]   ${item_name}    ${item_price}
    ${items}      Get Elements    ${inventory_item_element} 
    
    FOR    ${item}    IN    @{items}
           ${name}      Get Text   ${item} >> ${inventory_item_name_element}
           ${price}     Get Text   ${item} >> ${inventory_item_price_element} 

           Run Keyword If   '${name}' == '${item_name}' and '${price}' == '${item_price}'    
           ...    Click checkout button
    END


Click checkout button
    Click  ${checkout_cart_button_element}    