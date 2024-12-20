*** Settings ***
Library     SeleniumLibrary
Resource    ../locators/page_selectors.resource

*** Variables ***
${BROWSER}    chrome
${BROWSER_CHROMEHEADLESS}     headlesschrome
${URL}      https://qualitytoolsautomation.com.br/


*** Keywords ***
Open Browser before testing
    Open Browser    ${URL}    ${BROWSER_CHROMEHEADLESS}
    Title Should Be   Quality Tools Automation
    Maximize Browser Window

Close Browser after testing 
    Close Browser

Type a title in the search field
    [Arguments]    ${search}
    Input Text    ${SEARCH_FIELD}    ${search}
    Page Should Contain    ${search}