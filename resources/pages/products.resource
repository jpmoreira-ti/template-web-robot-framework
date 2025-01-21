*** Settings ***
Library    Browser
Library    Collections
Library    JSONLibrary
Resource   ../locators/products_elements.resource
Resource   ../locators/cart_elements.resource
Resource   ../commons.resource

 
*** Variables ***
${LIST_PRODUCTS}           ${CURDIR}/../data_test/products.json
${PRODUCTS_REMOVE_BTN}     Remove
${PRODUCTS_YOUR_CART_MSG}  Your Cart

*** Keywords ***
Click add cart button after checking product
    [Arguments]   ${item_name}    ${item_price}
    ${items}      Get Elements    ${inventory_item_element} 
    
    FOR    ${item}    IN    @{items}
           ${name}      Get Text   ${item} >> ${inventory_item_name_element}
           ${price}     Get Text   ${item} >> ${inventory_item_price_element} 

           Run Keyword If   '${name}' == '${item_name}' and '${price}' == '${item_price}'    
           ...    Click Add To Cart Button    ${item}
    END

Click Add To Cart Button
    [Arguments]   ${item}
    ${add_to_cart_button}    Get Element   ${item} >> ${add_to_cart_button_element}
    Click  ${add_to_cart_button}    

When I add a product to the cart
    [Arguments]   ${item_name}      ${item_price}
    Click add cart button after checking product  ${item_name}      ${item_price}

    Wait For Elements State           ${remove_to_cart_button_element}    timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_remove_button}      Get Text                            ${remove_to_cart_button_element}
    
    Should Be Equal As Strings        ${actual_text_remove_button}        ${PRODUCTS_REMOVE_BTN}

When I go to my cart page with the product
    [Arguments]   ${item_name}    ${item_price}
    Click    ${shopping_cart_link_element}

    Wait For Elements State         ${title_carts_element}        timeout=${DEFAULT_TIMEOUT_ELEMENT}
    ${actual_text_title_carts}      Get Text                      ${title_carts_element}  

    Should Be Equal As Strings      ${actual_text_title_carts}    ${PRODUCTS_YOUR_CART_MSG}

Random product
    ${products_data}    Load JSON From File    ${LIST_PRODUCTS}
    ${products}         Get From Dictionary    ${products_data}    products  
    ${random_index}     Evaluate    random.randint(0, len(${products}) - 1)
    ${name}             Get From Dictionary    ${products}[${random_index}]    name
    ${price}            Get From Dictionary    ${products}[${random_index}]    price

    Set Test Variable    ${PRODUCT_NAME}    ${name}
    Set Test Variable    ${PRODUCT_PRICE}   ${price}    
