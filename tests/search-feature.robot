*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/search_web.resource
Test Setup     Open Browser before testing 
Test Teardown  Close Browser after testing  

*** Test Cases ***
Verify Search on page
    [Documentation]   
    [Tags]    search_on_page
    Type a title in the search field    Robot F. Web